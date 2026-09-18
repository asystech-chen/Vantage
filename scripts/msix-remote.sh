#!/usr/bin/env bash
# msix-remote.sh — 把 MSIX 预打包 zip 送到打包机，封成 .msix，再拉回仓库根目录
#
# 传输方式：
#   http（默认）— 走 home-nas 上的 Vantage MSIX API（scripts/msix-service.ps1）
#                 本机不需要 SSH 私钥、不需要 makeappx，只需要一个 bearer token
#   ssh           — 老方式：scp 上传 + 远端 PowerShell 执行（备用/应急）
#
# 用法:
#   scripts/msix-remote.sh [选项] [预打包.zip]
#
# 选项:
#   --transport http|ssh   默认 http（或环境变量 MSIX_TRANSPORT）
#   --url URL              HTTP 模式的服务地址（默认 http://home-nas.local:38417）
#   --token-file PATH      token 文件（默认 <repo>/.cache/msix-token，或环境变量 MSIX_TOKEN）
#   --host HOST            SSH 模式的主机（默认 home-nas）
#   --dir  DIR             SSH 模式的工作目录（默认 D:/vantage-msix）
#   --tools DIR            SSH 模式的本机 makeappx 缓存目录
#                          （默认 <repo>/.cache/msix-tools/x64）
#   --provision-only       仅装备打包机（仅 SSH 模式有意义）
#   --clean                HTTP 模式：下载完成后让服务端删掉该任务的中间文件
#   -h, --help
#
# 不传 zip 时自动取仓库根最新的 *.msix-prepackage.zip。
# 打包机不可达时**不报错**，只提示并退出 0（不阻塞构建）。
#
# why remote: Linux 上无法完成 makeappx 封包（wine 的 ntdll 把 makeappx 依赖的
#      RtlInitializeGenericTableAvl 等 AVL API 实现成空 stub，静默 exit 1）。
set -uo pipefail

TRANSPORT="${MSIX_TRANSPORT:-http}"
URL="${MSIX_URL:-http://home-nas.local:38417}"
HOST="home-nas"
RDIR="D:/vantage-msix"
ZIP=""
PROVISION_ONLY=0
CLEAN=0

while [ $# -gt 0 ]; do
  case "$1" in
    --transport) TRANSPORT="$2"; shift 2 ;;
    --url) URL="${2%/}"; shift 2 ;;
    --token-file) TOKEN_FILE_OPT="$2"; shift 2 ;;
    --host) HOST="$2"; shift 2 ;;
    --dir)  RDIR="$2"; shift 2 ;;
    --tools) TOOLS_DIR_OPT="$2"; shift 2 ;;
    --provision-only) PROVISION_ONLY=1; shift ;;
    --clean) CLEAN=1; shift ;;
    -h|--help) sed -n '2,26p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    -*) echo "未知选项: $1" >&2; exit 2 ;;
    *)  ZIP="$1"; shift ;;
  esac
done

REPO="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO"

# ── 选输入 ─────────────────────────────────────────────────────────────
[ -n "$ZIP" ] || ZIP="$(ls -t ./*.msix-prepackage.zip 2>/dev/null | head -1)"
if [ -z "$ZIP" ] || [ ! -f "$ZIP" ]; then
  echo "❌ 找不到预打包 zip（先跑 make package-msix，或显式传入路径）" >&2
  exit 1
fi

BASE="$(basename "$ZIP" .msix-prepackage.zip)"     # 例: vantage-153.2.0-1.x86_64
OUT_NAME="${BASE}.msix"
ARCH="$(printf '%s' "$BASE" | grep -oE 'x86_64|aarch64$' | head -1)"
[ -n "$ARCH" ] || ARCH="$(printf '%s' "$BASE" | grep -oE '(x86_64|aarch64)' | head -1)"
if [ -z "$ARCH" ]; then echo "❌ 无法从文件名判断架构: $BASE" >&2; exit 1; fi

echo ">>> [MSIX-REMOTE] 传输: $TRANSPORT"
echo "    输入: $(basename "$ZIP")"
echo "    产物: $OUT_NAME  (arch=$ARCH)"

# ═══════════════════════ HTTP 模式 ═══════════════════════
if [ "$TRANSPORT" = "http" ]; then
  # token 解析顺序: MSIX_TOKEN 环境变量 → --token-file → <repo>/.cache/msix-token
  #                → ~/.config/vantage/msix-token
  # CI 里 $GITHUB_WORKSPACE 会被整体清空，所以自托管 runner 上把 token 放在
  # HOME 下最省事（不依赖 GitHub Secret）；用 GitHub Secret 注入 MSIX_TOKEN 亦可。
  TOKEN=""
  if [ -n "${MSIX_TOKEN:-}" ]; then
    TOKEN="$MSIX_TOKEN"
  else
    for _cand in ${TOKEN_FILE_OPT:-} "$REPO/.cache/msix-token" "$HOME/.config/vantage/msix-token"; do
      [ -n "$_cand" ] && [ -f "$_cand" ] && { TOKEN="$(tr -d ' \t\r\n' < "$_cand")"; break; }
    done
  fi
  if [ -z "$TOKEN" ]; then
    echo "⚠️  找不到 token（MSIX_TOKEN / <repo>/.cache/msix-token / ~/.config/vantage/msix-token）→ 跳过远程封包"
    echo "    token 在打包机上: D:\\vantage-msix\\secrets\\token.txt"
    exit 0
  fi
  AUTH="Authorization: Bearer $TOKEN"

  # 网络重试：到打包机的链路偶尔抖一下（2026-09-17 实例：x86_64 的封包请求根本没到
  # 服务端，被静默跳过，release 里少了 msix）。瞬时失败不该等于跳过。
  # 用法: retry_curl <次数> <间隔秒> <curl 参数...>（输出与退出码透传最后一次）
  retry_curl() {
    local _n="$1" _d="$2"; shift 2
    local _i=1 _rc=0
    while :; do
      "$@" && return 0
      _rc=$?
      [ "$_i" -ge "$_n" ] && return "$_rc"
      echo "    ⚠️  第 $_i/$_n 次失败（curl exit=$_rc），${_d}s 后重试..." >&2
      sleep "$_d"
      _i=$((_i + 1))
    done
  }

  # ⚠️ 以下所有发往打包机的请求都显式 --noproxy：CI runner 的环境里常带
  #    http_proxy（例: http://127.0.0.1:7890），而 no_proxy 通常只含 localhost，
  #    会把 home-nas.local 也交给代理 → mihomo/代理解析不了 .local（mDNS）→ 探测失败。
  #    （2026-09-14 CI 踩坑：远程封包被静默跳过，release 里没有 msix）
  # 可达性 + 鉴权探测（3 次重试 × 10 秒；全部失败才跳过，不阻塞构建）
  HEALTH="$(retry_curl 3 5 curl -sS --noproxy '*' --max-time 10 -H "$AUTH" "$URL/v1/health" || true)"
  case "$HEALTH" in
    *'"ok":true'*)
      echo "    服务: $URL  ($(printf '%s' "$HEALTH" | sed 's/^{//; s/}$//'))"
      ;;
    *)
      echo "⚠️  $URL 不可达或鉴权失败 → 跳过远程封包"
      echo "    预打包产物仍在: $ZIP"
      exit 0
      ;;
  esac

  echo ">>> [MSIX-REMOTE] 上传并封包（服务端约 50-60 秒）..."
  T0=$(date +%s)
  RES="$(retry_curl 2 10 curl -sS --noproxy '*' --max-time 900 -X POST \
      -H "$AUTH" -H 'Content-Type: application/octet-stream' \
      --data-binary "@$ZIP" "$URL/v1/pack?arch=$ARCH" 2>&1)"
  RC=$?
  T1=$(date +%s)
  if [ $RC -ne 0 ]; then
    echo "❌ 上传/封包请求失败（curl exit=$RC）:" >&2
    echo "$RES" >&2
    exit 1
  fi
  echo "$RES" | sed 's/^/    /'

  SHA_REMOTE="$(printf '%s' "$RES" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("sha256",""))' 2>/dev/null)"
  JOB="$(printf '%s' "$RES" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("job",""))' 2>/dev/null)"
  OUT_REMOTE="$(printf '%s' "$RES" | python3 -c 'import sys,json;print(json.load(sys.stdin).get("out",""))' 2>/dev/null)"
  if [ -z "$SHA_REMOTE" ] || [ -z "$OUT_REMOTE" ]; then
    echo "❌ 服务端没有返回 sha256/out，封包失败" >&2
    exit 1
  fi
  # 服务端产物名是按 job 命名的（唯一），本地落盘用版本名
  case "$OUT_REMOTE" in *".msix") ;; *) echo "❌ 服务端返回了意外的产物名: $OUT_REMOTE" >&2; exit 1 ;; esac
  echo "    服务端耗时: $((T1 - T0))s"

  echo ">>> [MSIX-REMOTE] 下载产物（服务端名 $OUT_REMOTE）..."
  retry_curl 2 10 curl -sS --noproxy '*' --max-time 900 -H "$AUTH" -o "./$OUT_NAME" "$URL/v1/artifact/$OUT_REMOTE" || {
    echo "❌ 下载失败" >&2; exit 1; }

  SHA_LOCAL="$(sha256sum "./$OUT_NAME" | cut -d' ' -f1)"
  if [ "$SHA_LOCAL" != "$SHA_REMOTE" ]; then
    echo "❌ 校验不一致！local=$SHA_LOCAL remote=$SHA_REMOTE" >&2
    exit 1
  fi

  if [ "$CLEAN" = "1" ] && [ -n "$JOB" ]; then
    curl -sS --noproxy '*' --max-time 30 -X DELETE -H "$AUTH" "$URL/v1/jobs/$JOB" >/dev/null && \
      echo ">>> [MSIX-REMOTE] 已清理服务端任务 $JOB"
  fi

  ls -lh "./$OUT_NAME"
  echo "✅ [MSIX-REMOTE] 完成，SHA256 一致: $SHA_LOCAL"
  exit 0
fi

# ═══════════════════════ SSH 模式（备用） ═══════════════════════
TOOLS_LOCAL="${TOOLS_DIR_OPT:-${MSIX_TOOLS_DIR:-$REPO/.cache/msix-tools/x64}}"

psrun() {
  local src b64
  src="$(cat)"
  b64="$(printf '%s' "$src" | python3 -c \
    "import sys,base64;print(base64.b64encode(sys.stdin.buffer.read().decode('utf-8').encode('utf-16-le')).decode())")"
  ssh -o BatchMode=yes -o ConnectTimeout=10 "$HOST" "powershell -NoProfile -EncodedCommand $b64"
}

remote_has() {
  [ "$(psrun <<PS | tr -d '\r' | tail -1
\$ErrorActionPreference='SilentlyContinue'
\$ProgressPreference='SilentlyContinue'
if (Test-Path '$1') { 'YES' } else { 'NO' }
PS
)" = "YES" ]
}

if ! ssh -o BatchMode=yes -o ConnectTimeout=3 "$HOST" "echo ok" >/dev/null 2>&1; then
  echo "⚠️  $HOST 不可达（离线 / 未装密钥）→ 跳过远程封包"
  echo "    预打包产物仍在: $ZIP"
  exit 0
fi

fetch_tools() {
  command -v curl >/dev/null 2>&1 || return 1
  mkdir -p "$TOOLS_LOCAL" || return 1
  local nupkg="$TOOLS_LOCAL/../sdk-buildtools.nupkg"
  echo ">>> [MSIX-REMOTE] 本机无工具缓存，从 NuGet 下载 Microsoft.Windows.SDK.BuildTools ..."
  curl -sSL --max-time 300 -o "$nupkg" \
    "https://www.nuget.org/api/v2/package/Microsoft.Windows.SDK.BuildTools" || return 1
  unzip -o -j "$nupkg" 'bin/*/x64/*' -d "$TOOLS_LOCAL" >/dev/null || return 1
  rm -f "$nupkg"
  [ -f "$TOOLS_LOCAL/makeappx.exe" ]
}

if ! remote_has "$RDIR/tools/makeappx.exe"; then
  echo ">>> [MSIX-REMOTE] 打包机缺少 makeappx.exe → 开始装备"
  [ -f "$TOOLS_LOCAL/makeappx.exe" ] || fetch_tools || {
    echo "❌ 拿不到 makeappx.exe。手动准备：" >&2
    echo "   1) 下载 https://www.nuget.org/api/v2/package/Microsoft.Windows.SDK.BuildTools (.nupkg 即 zip)" >&2
    echo "   2) 解压 bin/<版本>/x64/ 整个目录到 $TOOLS_LOCAL" >&2
    exit 1
  }
  psrun <<PS >/dev/null
\$ErrorActionPreference='Stop'
\$ProgressPreference='SilentlyContinue'
New-Item -ItemType Directory -Force -Path '$RDIR/in','$RDIR/out','$RDIR/tools' | Out-Null
PS
  echo ">>> [MSIX-REMOTE] 上传 makeappx 工具（$(du -sh "$TOOLS_LOCAL" | cut -f1)）..."
  scp -q "$TOOLS_LOCAL"/* "$HOST:$RDIR/tools/" || { echo "❌ 上传工具失败" >&2; exit 1; }
fi

if [ "$PROVISION_ONLY" = "1" ]; then
  echo "✅ [MSIX-REMOTE] 打包机已装备（$HOST:$RDIR/tools）"
  exit 0
fi

echo ">>> [MSIX-REMOTE] 上传 zip + 打包脚本..."
scp -q "$ZIP" "$HOST:$RDIR/in/" || { echo "❌ 上传 zip 失败" >&2; exit 1; }
scp -q "$REPO/scripts/msix-pack.ps1" "$HOST:$RDIR/tools/" || { echo "❌ 上传打包脚本失败" >&2; exit 1; }

echo ">>> [MSIX-REMOTE] 远端 makeappx pack..."
RES="$(ssh -o BatchMode=yes -o ConnectTimeout=10 "$HOST" \
  "powershell -NoProfile -ExecutionPolicy Bypass -File $RDIR/tools/msix-pack.ps1 -Zip $RDIR/in/$(basename "$ZIP") -Out $RDIR/out/$OUT_NAME")"
RC=$?
if [ $RC -ne 0 ]; then
  echo "❌ 远端封包失败（ssh exit=$RC）:" >&2
  echo "$RES" >&2
  exit 1
fi
echo "$RES" | sed 's/^/    /'

SHA_REMOTE="$(printf '%s\n' "$RES" | tr -d '\r' | grep -oE '^SHA256=[0-9a-f]{64}' | cut -d= -f2)"
if [ -z "$SHA_REMOTE" ]; then
  echo "❌ 没拿到远端 SHA256，封包可能失败" >&2
  exit 1
fi

echo ">>> [MSIX-REMOTE] 拉回产物..."
scp -q "$HOST:$RDIR/out/$OUT_NAME" "./$OUT_NAME" || { echo "❌ 拉回失败" >&2; exit 1; }

SHA_LOCAL="$(sha256sum "./$OUT_NAME" | cut -d' ' -f1)"
if [ "$SHA_LOCAL" != "$SHA_REMOTE" ]; then
  echo "❌ 校验不一致！local=$SHA_LOCAL remote=$SHA_REMOTE" >&2
  exit 1
fi

ls -lh "./$OUT_NAME"
echo "✅ [MSIX-REMOTE] 完成，SHA256 一致: $SHA_LOCAL"
