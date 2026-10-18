#!/usr/bin/env bash
set -euo pipefail

# ---------- 编译输出落盘（供 build-monitor.sh 取数，手动 / CI 通用） ----------
# CI runner 无 tmux，监控脚本改为读此日志文件；tee 让终端照常显示，副本实时落盘
# 覆盖模式：每次 build.sh 启动自动清空上一轮日志
exec > >(tee "$HOME/.openclaw/workspace/.build-output.log") 2>&1

# ==========================================
# Vantage 多平台自动编译/打包脚本
# 用法:
#   ./build.sh                              # 交互式选择编译
#   ./build.sh linux-x64                    # 编译单个目标
#   ./build.sh linux-x64 windows-x64 macos-arm64  # 编译多个目标
#   ./build.sh package                      # 交互式选择打包 (仅打包, 不编译)
#   ./build.sh package linux-x64 linux-arm64  # 打包指定目标
#   ./build.sh sign                        # 交互式选择签名 (仅 Linux)
#   ./build.sh sign linux-x64 linux-arm64   # 签名指定目标
#
# 编译流程自动包含: 编译 → 打包 → 签名 (Linux 目标)
# 签名使用 GPG 私钥: $HOME/vantage-repo-private-key.asc
#
# 可用目标:
#   linux-x64    linux-arm64    linux-loong64
#   windows-x64  windows-arm64
#   macos-x64    macos-arm64
#   也可用简写: lx la ll wx wa mx ma / all
#
# 功能验证（DEV）快速目标: 无 LTO / 无 PGO / cargo 增量，独立 objdir
#   linux-x64-dev    (简写 lxd)  —— 本机日常功能验证
#   windows-x64-dev  (简写 wxd)  —— Windows 交叉验证
#   ⚠️ DEV 产物仅用于功能/UI/逻辑验证，不代表发布性能；出正式包请用发布目标
#
# 编译/打包完成后：全部目标统一 GPG 签名，再执行 make checksum 生成校验和
# ==========================================

REPO_ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$REPO_ROOT"

# ---------- 目标定义 ----------
declare -A TARGETS=(
  ["linux-x64"]="Linux x64|assets/mozconfig.new|linux"
  ["linux-arm64"]="Linux arm64|assets/mozconfig.linux-arm64|linux"
  ["linux-loong64"]="Linux loong64|assets/mozconfig.linux-loong64|linux"
  ["windows-x64"]="Windows x64|assets/mozconfig.win-cross|windows"
  ["windows-arm64"]="Windows arm64|assets/mozconfig.win-cross.arm64|windows"
  ["macos-x64"]="macOS x64|assets/mozconfig.osx-cross|macos"
  ["macos-arm64"]="macOS arm64|assets/mozconfig.osx-cross-arm64|macos"
  # ---- 功能验证（DEV）快速构建：无 LTO / 无 PGO / cargo 增量，独立 objdir ----
  # 第 4 字段 "dev" = 标记为开发验证目标（跳过 PGO 拉取与 package-all/msix）
  ["linux-x64-dev"]="Linux x64 (DEV 快速)|assets/mozconfig.linux-x64-dev|linux|dev"
  ["windows-x64-dev"]="Windows x64 (DEV 快速)|assets/mozconfig.win-cross-dev|windows|dev"
)

# 简写映射
declare -A ALIASES=(
  ["lx"]="linux-x64"
  ["la"]="linux-arm64"
  ["ll"]="linux-loong64"
  ["wx"]="windows-x64"
  ["wa"]="windows-arm64"
  ["mx"]="macos-x64"
  ["ma"]="macos-arm64"
  ["lxd"]="linux-x64-dev"
  ["wxd"]="windows-x64-dev"
)

# 发布平台顺序（供 'all' 使用；不含 DEV 目标）
KEY_ORDER=(linux-x64 linux-arm64 linux-loong64 windows-x64 windows-arm64 macos-x64 macos-arm64)

# 交互菜单顺序（含 DEV 目标；'all' 仍只用 KEY_ORDER）
MENU_ORDER=("${KEY_ORDER[@]}" linux-x64-dev windows-x64-dev)

# ---------- 工具函数 ----------
red()    { echo -e "\033[31m$*\033[0m"; }
green()  { echo -e "\033[32m$*\033[0m"; }
yellow() { echo -e "\033[33m$*\033[0m"; }
bold()   { echo -e "\033[1m$*\033[0m"; }

die() {
  red "❌ $*"
  exit 1
}

# ---------- 编译监控自动挂载 ----------
# 编译开始时自动把 build-monitor.sh 挂到 crontab（幂等，每 2 分钟轮询），
# 编译结束时通过 QQ + 邮件双通道通知。
# 监控脚本位于 workspace（本机维护），不在仓库内；CI runner 上不存在则跳过。
ensure_build_monitor() {
  local monitor="$HOME/.openclaw/workspace/scripts/build-monitor.sh"
  [[ -f "$monitor" ]] || { yellow "⚠️ 未找到编译监控脚本 ($monitor)，跳过自动挂载"; return 0; }

  # crontab 命令不可用（无 cron 环境）时直接放弃，不影响编译
  if ! command -v crontab &>/dev/null; then
    yellow "⚠️ crontab 不可用，跳过编译监控挂载（不影响编译）"
    return 0
  fi

  # 清理旧状态，避免误发上一次未完成的通知
  rm -f "$HOME/.openclaw/workspace/.build-state"

  # 记录 build.sh 自身 PID：监控脚本以此判断整个流程（编译+打包+签名+校验）是否结束。
  # ⚠️ 不能只盯 mach build —— 多目标编译时第一个 make build 结束 ≠ build.sh 结束。
  echo "$$" > "$HOME/.openclaw/workspace/.build-pid"
  # build.sh 无论成功/失败/中断退出都清理 PID 文件（kill -9 除外，监控有兜底）
  trap 'rm -f "$HOME/.openclaw/workspace/.build-pid"' EXIT

  if crontab -l 2>/dev/null | grep -Fq "$monitor"; then
    green "✅ 编译监控已挂载 (crontab 每 2 分钟)"
  else
    # 挂载失败仅警告，绝不阻断编译（crontab 为空/损坏均走这里）
    if ( crontab -l 2>/dev/null | grep -vF "$monitor" || true; echo "*/2 * * * * $monitor" ) | crontab - 2>/dev/null; then
      green "✅ 已自动挂载编译监控 (crontab 每 2 分钟)"
    else
      yellow "⚠️ crontab 挂载失败，跳过编译监控（不影响编译）"
    fi
  fi
}

# ---------- 显示菜单（交互模式） ----------
show_menu() {
  echo ""
  bold "═══════════════════════════════════════"
  bold "  Vantage 多平台自动编译脚本"
  bold "═══════════════════════════════════════"
  echo ""
  echo "  请选择要编译的目标（输入编号，多个以空格分隔）："
  echo "  输入 'all' 选择全部，输入 'q' 退出。"
  echo ""

  local i=1
  for key in "${MENU_ORDER[@]}"; do
    IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
    printf "  %2d) %s\n" "$i" "$label"
    ((i++))
  done

  echo ""
}

# ---------- 解析参数为 key 列表 ----------
resolve_args() {
  local keys=()
  for arg in "$@"; do
    # 简写
    if [[ -n "${ALIASES[$arg]:-}" ]]; then
      keys+=("${ALIASES[$arg]}")
    elif [[ "$arg" == "all" ]]; then
      keys+=("${KEY_ORDER[@]}")
    elif [[ -n "${TARGETS[$arg]:-}" ]]; then
      keys+=("$arg")
    else
      die "未知目标: '$arg'。可用: linux-x64, linux-arm64, linux-loong64, windows-x64, windows-arm64, macos-x64, macos-arm64, linux-x64-dev, windows-x64-dev (或简写: lx la ll wx wa mx ma lxd wxd / all)"
    fi
  done
  # 去重并保持顺序
  printf '%s\n' "${keys[@]}" | awk '!seen[$0]++'
}

# ---------- 显示目标列表 ----------
show_targets() {
  echo "" >&2
  bold "═══════════════════════════════════════" >&2
  bold "  可用编译目标" >&2
  bold "═══════════════════════════════════════" >&2
  echo "" >&2
  local i=1
  for key in "${MENU_ORDER[@]}"; do
    IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
    printf "  %2d) %s\n" "$i" "$label" >&2
    ((i++))
  done
  echo "" >&2
  bold "  输入编号多选（空格分隔），或 'all' 全选，'q' 退出" >&2
  bold "═══════════════════════════════════════" >&2
  echo "" >&2
}

# ---------- 交互式选择 ----------
interactive_select() {
  local input raw_choices choices=()

  while true; do
    # 先显示目标列表（输出到 stderr/终端）
    show_targets

    echo -n "👉 你的选择： " >&2
    read -r input

    if [[ "$input" == "q" ]]; then
      echo "" >&2
      yellow "已取消。" >&2
      exit 0
    fi

    if [[ "$input" == "all" ]]; then
      choices=("${KEY_ORDER[@]}")
      break
    fi

    raw_choices=($input)
    choices=()
    local ok=true
    for c in "${raw_choices[@]}"; do
      if [[ "$c" =~ ^[0-9]+$ ]] && [[ "$c" -ge 1 ]] && [[ "$c" -le "${#MENU_ORDER[@]}" ]]; then
        idx=$((c - 1))
        choices+=("${MENU_ORDER[$idx]}")
      else
        red "  无效选择：$c（请输入 1-${#MENU_ORDER[@]}、'all' 或 'q'）" >&2
        ok=false
        break
      fi
    done

    if $ok && [[ ${#choices[@]} -gt 0 ]]; then
      break
    fi
  done

  # 只输出结果到 stdout（供 readarray 捕获）
  printf '%s\n' "${choices[@]}" | awk '!seen[$0]++'
}


# ---------- 单目标编译 ----------
build_target() {
  local key="$1"
  IFS='|' read -r label mozconfig os_type dev_flag <<< "${TARGETS[$key]}"

  echo ""
  bold "───────────────────────────────────────────"
  bold "  开始编译: $label"
  bold "  mozconfig: $mozconfig"
  bold "───────────────────────────────────────────"
  echo ""

  # Step 1: 导出 mozconfig + 准备源码
  green ">>> [1/3] 导出 MOZCONFIG 并准备源码 (make dir)..."
  export MOZCONFIG="$REPO_ROOT/$mozconfig"
  make dir

  # Windows 目标：替换 Vantage 7zSFX stub（make dir 后、打包前；CI 之前漏跑导致安装器带 Firefox stub）
  if [[ "$os_type" == "windows" ]]; then
    green ">>> Windows 目标：应用 Vantage 7zSFX stub..."
    ./scripts/setup-7zsfx.sh || red "⚠️ setup-7zsfx.sh 失败（非致命，安装器可能带 Firefox stub）"
    # wine 前缀必须预先存在：首次在并行 midl 调用里自动创建会失败（退出码 225）
    prepare_wine_prefix
  fi

  # PGO：DEV 目标不用 PGO，直接跳过拉取；发布目标按平台拉取（失败/mozconfig 会自动跳过，不影响构建）
  if [[ "$dev_flag" != "dev" ]] && [ -x "$REPO_ROOT/scripts/fetch-pgo-profile.sh" ]; then
    "$REPO_ROOT/scripts/fetch-pgo-profile.sh" "$key" || yellow "⚠️  PGO profile 拉取失败：本次不使用 PGO"
  fi

  # rust：确保 1.94.1 + 交叉 target（mozconfig 里已 export RUSTUP_TOOLCHAIN=1.94.1；缺失才装）
  # 1.94.1 的 LLVM 与 bootstrap clang 一致 → 跨语言 LTO / PGO 匹配；可用 RUSTUP_DIST_SERVER 指定镜像
  if command -v rustup >/dev/null 2>&1; then
    if ! rustup toolchain list 2>/dev/null | grep -q '^1\.94\.1-'; then
      yellow ">>> 安装 rust 1.94.1（跨语言 LTO 需要）..."
      rustup toolchain install 1.94.1 --profile minimal || { red "❌ rust 1.94.1 安装失败"; return 1; }
    fi
    for _t in aarch64-unknown-linux-gnu x86_64-pc-windows-msvc aarch64-pc-windows-msvc; do
      rustup target list --installed --toolchain 1.94.1 2>/dev/null | grep -qx "$_t" \
        || rustup target add --toolchain 1.94.1 "$_t" || red "⚠️  rust target $_t 安装失败（该目标可能构建失败）"
    done
  else
    yellow "⚠️  未找到 rustup，跳过 rust 1.94.1 检查（构建可能失败）"
  fi

  # Step 2: 编译
  green ">>> [2/3] 编译 (make build)..."
  make build || { red "❌ $label 编译失败"; return 1; }

  # Step 3: 打包（签名统一在全部目标完成后做）
  green ">>> [3/3] 打包 (make package)..."
  make package || { red "❌ $label 打包失败"; return 1; }

  # DEV 目标：make package 已产出本地化可验证包（含多语言），跳过发布专用的额外打包
  if [[ "$dev_flag" == "dev" ]]; then
    echo ""
    yellow ">>> DEV 目标：已由 make package 产出本地化包，跳过 package-all / msix（如需可手动执行）"
  elif [[ "$os_type" == "linux" ]]; then
    # 对 Linux 目标额外执行 package-all (deb/rpm/AppImage/tar.gz)
    echo ""
    green ">>> Linux 目标：执行 make package-all (deb/rpm/AppImage/tar.gz)..."
    # 签名统一在全部目标打包完成后做（见 sign_and_checksum）
    make package-all || red "⚠️  $label package-all 失败（非致命）"
  elif [[ "$os_type" == "windows" ]]; then
    # 对 Windows 目标额外执行 package-msix
    echo ""
    green ">>> Windows 目标：WinUpdater 自动随 make package 打包"
    green ">>> Windows 目标：执行 make package-msix..."
    make package-msix || red "⚠️  $label package-msix 失败（非致命）"
  fi

  # 验证产物
  echo ""
  green ">>> 当前根目录下的打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到 vantage-* 产物)"

  green "✅ $label 编译流程完成"
}

# ---------- 单独打包目标（跳过编译，直接 package-all） ----------
package_target() {
  local key="$1"
  IFS='|' read -r label mozconfig os_type _dev <<< "${TARGETS[$key]}"

  echo ""
  bold "───────────────────────────────────────────"
  bold "  开始打包: $label"
  bold "  mozconfig: $mozconfig"
  bold "───────────────────────────────────────────"
  echo ""

  export MOZCONFIG="$REPO_ROOT/$mozconfig"

  case "$os_type" in
    linux)
      green ">>> 执行 make package-all (deb/rpm/AppImage/tar.gz)..."
      make package-all || { red "❌ $label package-all 失败"; return 1; }
      ;;
    windows)
      green ">>> 执行 make package（含 WinUpdater 自动打包）..."
      make package || { red "❌ $label package 失败"; return 1; }
      echo ""
      green ">>> 执行 make package-msix..."
      make package-msix || red "⚠️  $label package-msix 失败（非致命）"
      ;;
    macos)
      green ">>> 执行 make package (dmg)..."
      make package || { red "❌ $label package 失败"; return 1; }
      ;;
  esac

  echo ""
  green ">>> $label 打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到 vantage-* 产物)"

  green "✅ $label 打包流程完成"
}

# ---------- 打包主流程 ----------
package_main() {
  local selected=() total count=0 failed=() rc

  if [[ $# -gt 0 ]]; then
    readarray -t selected < <(resolve_args "$@")
  else
    readarray -t selected < <(interactive_select)
  fi

  # 确认清单
  echo ""
  bold "═══════════════════════════════════════"
  bold "  确认打包目标"
  bold "═══════════════════════════════════════"
  echo ""
  for key in "${selected[@]}"; do
    IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
    case "$os" in
      linux)   echo "    • $label  →  deb / rpm / AppImage / tar.gz" ;;
      windows) echo "    • $label  →  exe installer / zip / msix" ;;
      macos)   echo "    • $label  →  dmg" ;;
    esac
  done
  echo ""
  bold "═══════════════════════════════════════"
  echo ""

  if [[ $# -gt 0 ]]; then
    green "✅ 参数模式，直接开始打包..."
  else
    while true; do
      read -r -p "  👉 确认开始? (yes/no): " confirm
      case "$confirm" in
        yes|YES|y|Y) break ;;
        no|NO|n|N) yellow "已取消。"; exit 0 ;;
        *) red "请输入 yes 或 no" ;;
      esac
    done
    echo ""
  fi

  green "✅ 开始打包..."
  total=${#selected[@]}

  for key in "${selected[@]}"; do
    ((++count))
    echo ""
    bold "═══════════════════════════════════════"
    bold "  进度: $count / $total"
    bold "═══════════════════════════════════════"

    set +e
    package_target "$key"
    rc=$?
    set -e

    if [[ $rc -ne 0 ]]; then
      IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
      red "❌ $label 打包失败"
      failed+=("$label")
    fi
  done

  # 最终汇总
  echo ""
  bold "═══════════════════════════════════════"
  bold "  打包任务全部完成"
  bold "═══════════════════════════════════════"

  if [[ ${#failed[@]} -gt 0 ]]; then
    red "  以下目标打包失败:"
    for f in "${failed[@]}"; do
      red "    • $f"
    done
  fi

  echo ""
  green "📦 所有打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到产物)"

  # 全部目标打包完成后：统一签名 + 计算 SHA256SUMS
  sign_and_checksum

  if [[ ${#failed[@]} -eq 0 ]]; then
    green "🎉 所有目标打包成功！"
  else
    red "  ❌ 打包失败：${#failed[@]} / $total 个目标未完成"
    return 1
  fi
}

# ---------- 签名 ----------
GPG_KEY_ID="907587D2812D7F8C"
GPG_PRIVATE_KEY="$HOME/vantage-repo-private-key.asc"

ensure_gpg_key() {
  local soft="${1:-}"
  if ! gpg --list-secret-keys "$GPG_KEY_ID" >/dev/null 2>&1; then
    if [[ -f "$GPG_PRIVATE_KEY" ]]; then
      green ">>> 导入 GPG 私钥: $GPG_PRIVATE_KEY"
      if ! gpg --batch --import "$GPG_PRIVATE_KEY"; then
        if [[ "$soft" == "soft" ]]; then
          yellow "⚠️  GPG 私钥导入失败（签名将不可用）"
          return 1
        fi
        die "GPG 私钥导入失败"
      fi
    else
      if [[ "$soft" == "soft" ]]; then
        yellow "⚠️  未找到 GPG 私钥: $GPG_PRIVATE_KEY（签名将不可用）"
        return 1
      fi
      die "未找到 GPG 私钥: $GPG_PRIVATE_KEY"
    fi
  fi
  if ! grep -q '%_gpg_name' ~/.rpmmacros 2>/dev/null; then
    echo '%_signature gpg' >> ~/.rpmmacros
    echo "%_gpg_name Vantage Browser <repo@vantage.asystech.cn>" >> ~/.rpmmacros
  fi
  return 0
}

# 统一签名 + 校验和：所有目标打包完成后只跑一次
sign_and_checksum() {
  echo ""
  bold "───────────────────────────────────────────"
  bold "  统一签名 + 校验和"
  bold "───────────────────────────────────────────"
  echo ""

  if ensure_gpg_key soft; then
    make sign-all || red "⚠️  部分包签名失败（见上方输出）"
    echo ""
    make checksum 2>/dev/null || yellow "  (checksum 生成失败)"
  else
    yellow "⚠️  GPG 私钥不可用，跳过包签名；仅生成未签名 SHA256SUMS:"
    make checksum 2>/dev/null || yellow "  (checksum 生成失败)"
  fi
  echo ""
  verify_signatures
}

# 签名结果自检：逐类检查是否真带上了签名
verify_signatures() {
  local f sig total=0 signed=0

  # .deb：看内嵌 _gpgorigin 成员
  for f in vantage_*_*.deb; do
    [[ -f "$f" ]] || continue
    total=$((total + 1))
    if ar t "$f" 2>/dev/null | grep -qx _gpgorigin; then
      signed=$((signed + 1))
    else
      red "  ✗ 未签名 deb: $f"
    fi
  done

  # .rpm：签名可能落在 SIGPGP / RSAHEADER / DSAHEADER（rpm 4.20 用 RSAHEADER）
  for f in vantage-*.rpm; do
    [[ -f "$f" ]] || continue
    total=$((total + 1))
    sig="$(rpm -qp --qf '%{SIGPGP:pgpsig}|%{RSAHEADER:pgpsig}|%{DSAHEADER:pgpsig}' "$f" 2>/dev/null || true)"
    if [[ "$sig" =~ (RSA|DSA|PGP)/ ]]; then
      signed=$((signed + 1))
    else
      red "  ✗ 未签名 rpm: $f"
    fi
  done

  # AppImage / portable.tar.gz：看分离签名
  for f in vantage-*.AppImage vantage-*.portable.tar.gz; do
    [[ -f "$f" ]] || continue
    total=$((total + 1))
    if [[ -f "$f.asc" ]]; then
      signed=$((signed + 1))
    else
      red "  ✗ 缺少分离签名: $f.asc"
    fi
  done

  if [[ $total -eq 0 ]]; then
    yellow "  (没有可校验的产物)"
  elif [[ $signed -eq $total ]]; then
    green "🔎 签名校验: $signed / $total 全部通过"
  else
    yellow "🔎 签名校验: $signed / $total（未通过项见上）"
  fi
}

# Windows 交叉编译：wine 前缀必须提前建好。
# 首次构建时几十个 midl.exe 并行触发自动建前缀会互相踩，全部退出 225（2026-10-18 实测）。
prepare_wine_prefix() {
  local winebin="" winebootbin=""
  if [[ -x "$HOME/.mozbuild/wine/bin/wine" ]]; then
    winebin="$HOME/.mozbuild/wine/bin/wine"
    winebootbin="$HOME/.mozbuild/wine/bin/wineboot"
  elif command -v wine >/dev/null 2>&1; then
    winebin="$(command -v wine)"
    winebootbin="$(command -v wineboot 2>/dev/null || true)"
  fi

  export WINEPREFIX="${WINEPREFIX:-$HOME/.cache/wine-msvc}"
  if [[ -d "$WINEPREFIX/drive_c" ]]; then
    green ">>> Wine 前缀已就绪: $WINEPREFIX"
    return 0
  fi

  mkdir -p "$WINEPREFIX"
  green ">>> 初始化 Wine 前缀: $WINEPREFIX"
  if [[ -z "$winebin" ]]; then
    yellow "⚠️  未找到 wine，跳过前缀初始化（Windows 目标可能失败）"
    return 1
  fi

  if [[ -n "$winebootbin" && -x "$winebootbin" ]]; then
    WINEDEBUG=-all timeout 300 "$winebootbin" -u >"$WINEPREFIX/init.log" 2>&1 || true
  else
    WINEDEBUG=-all timeout 300 "$winebin" wineboot -u >"$WINEPREFIX/init.log" 2>&1 || true
  fi

  if [[ ! -d "$WINEPREFIX/drive_c" ]]; then
    yellow "⚠️  Wine 前缀初始化失败（Windows 目标可能失败），日志前 10 行："
    sed -n '1,10p' "$WINEPREFIX/init.log" 2>/dev/null | sed 's/^/    /'
    return 1
  fi
  green "✅ Wine 前缀初始化完成"

  # 冒烟测试：直接用 wine 跑一次 midl.exe，提前暴露沙箱/前缀问题（而不是等 make 里成片退出 225）
  local midl="" d
  for d in "$HOME/.mozbuild/vs/Windows Kits/10/bin"/10.*; do
    [[ -x "$d/x64/midl.exe" ]] && midl="$d/x64/midl.exe"
  done
  if [[ -n "$midl" ]]; then
    local srt=0
    WINEDEBUG=-all timeout 120 "$winebin" "$midl" -? >"$WINEPREFIX/smoke.log" 2>&1 || srt=$?
    if [[ $srt -eq 0 ]]; then
      green "✅ Wine 冒烟测试通过（midl.exe 可运行）"
    else
      yellow "⚠️  Wine 冒烟测试失败（midl.exe 退出码 $srt），日志前 10 行："
      sed -n '1,10p' "$WINEPREFIX/smoke.log" 2>/dev/null | sed 's/^/    /'
      return 1
    fi
  fi
  return 0
}

sign_target() {
  local key="$1"
  IFS='|' read -r label mozconfig os_type _dev <<< "${TARGETS[$key]}"

  if [[ "$os_type" != "linux" ]]; then
    yellow "⚠️  $label 不是 Linux 目标，跳过签名"
    return 0
  fi

  ensure_gpg_key

  echo ""
  bold "───────────────────────────────────────────"
  bold "  开始签名: $label"
  bold "───────────────────────────────────────────"
  echo ""

  local ver arch deb_arch pkg signed=0
  ver="$(cat "$REPO_ROOT/version")"
  arch=$(grep -oE 'target=[^ \t]*' "$REPO_ROOT/$mozconfig" 2>/dev/null | grep -oE '(aarch64|arm64|loongarch64|x86_64)' | head -1 | sed 's/arm64/aarch64/')
  [ -z "$arch" ] && arch="x86_64"
  case "$arch" in
    x86_64) deb_arch="amd64" ;;
    aarch64) deb_arch="arm64" ;;
    loongarch64) deb_arch="loong64" ;;
    *) deb_arch="$arch" ;;
  esac

  # debsigs 内嵌签名: .deb (类似 rpmsign)
  for pkg in vantage_${ver}-*_${deb_arch}.deb; do
    [[ -f "$pkg" ]] || continue
    green "  DEBSIGS: $pkg"
    if debsigs --sign=origin --default-key="$GPG_KEY_ID" "$pkg" 2>/dev/null; then
      ((signed++)) || true
    else
      red "  ❌ debsigs 签名失败: $pkg"
    fi
  done

  # GPG 分离签名: .AppImage / .tar.gz
  local detach_globs=(
    "vantage-${ver}-*.${arch}.AppImage"
    "vantage-${ver}-*.${arch}.portable.tar.gz"
  )
  for glob in "${detach_globs[@]}"; do
    for pkg in $glob; do
      [[ -f "$pkg" ]] || continue
      [[ -f "${pkg}.asc" ]] && continue
      green "  GPG 签名: $pkg"
      if gpg --batch --yes --detach-sign --armor -u "$GPG_KEY_ID" "$pkg"; then
        ((signed++)) || true
      else
        red "  ❌ 签名失败: $pkg"
      fi
    done
  done

  for pkg in vantage-${ver}-*.${arch}.rpm; do
    [[ -f "$pkg" ]] || continue
    green "  RPMSIGN: $pkg"
    if rpmsign --addsign "$pkg" 2>/dev/null; then
      ((signed++)) || true
    else
      red "  ❌ RPM 签名失败: $pkg"
    fi
  done

  echo ""
  green "✅ $label 签名完成 (已签名 $signed 个包)"
}

sign_main() {
  local selected=() total count=0 rc

  if [[ $# -gt 0 ]]; then
    readarray -t selected < <(resolve_args "$@")
  else
    readarray -t selected < <(interactive_select)
  fi

  echo ""
  bold "═══════════════════════════════════════"
  bold "  确认签名目标"
  bold "═══════════════════════════════════════"
  echo ""
  for key in "${selected[@]}"; do
    IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
    if [[ "$os" == "linux" ]]; then
      echo "    • $label  →  debsigs (.deb) + rpmsign (.rpm) + GPG (.AppImage/.tar.gz)"
    else
      echo "    • $label  →  ⚠️ 非 Linux，跳过"
    fi
  done
  echo ""
  bold "═══════════════════════════════════════"
  echo ""

  if [[ $# -gt 0 ]]; then
    green "✅ 参数模式，直接开始签名..."
  else
    while true; do
      read -r -p "  👉 确认开始? (yes/no): " confirm
      case "$confirm" in
        yes|YES|y|Y) break ;;
        no|NO|n|N) yellow "已取消。"; exit 0 ;;
        *) red "请输入 yes 或 no" ;;
      esac
    done
    echo ""
  fi

  green "✅ 开始签名..."
  total=${#selected[@]}

  for key in "${selected[@]}"; do
    ((++count))
    echo ""
    bold "═══════════════════════════════════════"
    bold "  进度: $count / $total"
    bold "═══════════════════════════════════════"

    set +e
    sign_target "$key"
    rc=$?
    set -e

    if [[ $rc -ne 0 ]]; then
      IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
      red "❌ $label 签名失败"
    fi
  done

  echo ""
  bold "═══════════════════════════════════════"
  bold "  签名任务全部完成"
  bold "═══════════════════════════════════════"
  echo ""
  green "📝 已签名的文件:"
  ls -lh *.asc 2>/dev/null || yellow "  (无 .asc 文件)"
  echo ""
  green "🎉 所有目标签名完成！"
}

# ---------- 主流程 ----------
main() {
  # 子命令路由: package → 只打包不编译, sign → 签名
  if [[ "${1:-}" == "package" ]]; then
    shift
    package_main "$@"
    return $?
  fi
  if [[ "${1:-}" == "sign" ]]; then
    shift
    sign_main "$@"
    return $?
  fi

  local selected=() total count=0 failed=() rc

  if [[ $# -gt 0 ]]; then
    # 参数模式：直接解析
    readarray -t selected < <(resolve_args "$@")
  else
    # 交互模式
    readarray -t selected < <(interactive_select)
  fi

  # 确认清单
  echo ""
  bold "═══════════════════════════════════════"
  bold "  确认编译目标"
  bold "═══════════════════════════════════════"
  echo ""
  for key in "${selected[@]}"; do
    IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
    echo "    • $label"
  done
  echo ""
  bold "═══════════════════════════════════════"
  echo ""
  yellow "⚠️  每个目标的编译耗时可能很长（数小时），"
  yellow "    请确保有足够的磁盘空间和编译工具链。"
  echo ""

  # 参数模式跳过确认，直接开始
  if [[ $# -gt 0 ]]; then
    green "✅ 参数模式，直接开始编译..."
  else
    while true; do
      read -r -p "  👉 确认开始? (yes/no): " confirm
      case "$confirm" in
        yes|YES|y|Y) break ;;
        no|NO|n|N) yellow "已取消。"; exit 0 ;;
        *) red "请输入 yes 或 no" ;;
      esac
    done
    echo ""
  fi

  green "✅ 开始编译..."
  ensure_build_monitor
  total=${#selected[@]}

  for key in "${selected[@]}"; do
    ((++count))
    echo ""
    bold "═══════════════════════════════════════"
    bold "  进度: $count / $total"
    bold "═══════════════════════════════════════"

    set +e
    build_target "$key"
    rc=$?
    set -e

    if [[ $rc -ne 0 ]]; then
      IFS='|' read -r label cfg os _dev <<< "${TARGETS[$key]}"
      red "❌ $label 编译失败"
      failed+=("$label")
    fi
  done

  # 最终汇总
  echo ""
  bold "═══════════════════════════════════════"
  bold "  编译任务全部完成"
  bold "═══════════════════════════════════════"

  if [[ ${#failed[@]} -gt 0 ]]; then
    red "  以下目标编译失败:"
    for f in "${failed[@]}"; do
      red "    • $f"
    done
  fi

  echo ""
  green "📦 所有打包产物:"
  ls -lh vantage-* 2>/dev/null || yellow "  (未找到产物)"

  # 全部目标打包完成后：统一签名 + 计算 SHA256SUMS
  sign_and_checksum

  if [[ ${#failed[@]} -eq 0 ]]; then
    green "🎉 所有目标编译成功！"
  else
    red "  ❌ 构建失败：${#failed[@]} / $total 个目标未完成"
    return 1
  fi
}

main "$@"
