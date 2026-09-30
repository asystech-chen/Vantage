#!/usr/bin/env bash
# ============================================================================
# fetch-l10n-cache.sh — 预填充 Vantage 构建所需的 l10n 缓存（免联网跑 make dir）
#
# 产物（放仓库根目录下；.cache/ 已被 .gitignore 忽略，不影响 git status）：
#   <repo-root>/.cache/l10n/l10n.zip               完整包（~110 MB）
#   <repo-root>/.cache/l10n/firefox-l10n-main/     解压结果（158 个语言目录）
#
# 为什么需要它：
#   GitHub codeload 走 chunked 传输、**不返回 content-length**，
#   且实测对 Range 请求返回 200（不是 206）⇒ 既不支持断点续传、也不能多连接。
#   而 scripts/librewolf-patches.py 用的 `curl -sLo` 中途断流也返回 0，
#   于是留下截断 zip → 解压失败 → lw/l10n 没生成 →
#   configure 报：Invalid value --with-l10n-base, .../lw/l10n doesn't exist
#   本脚本用「多轮重试 + unzip -t 强校验」保证拿到的必是完整包。
#
# 重要：librewolf-patches.py 只认 .cache/l10n/ 下的 zip / 解压结果——
#   只要 zip 完整（或解压目录完好）它就绝不会联网重下，本脚本负责保证这一点。
#   （2026-10-01 顺带修掉了它「解压缓存判据恒为假、每次 make dir 白重解一遍」的问题。）
#
# 用法：
#   scripts/fetch-l10n-cache.sh                                     # 自动选下载器
#   L10N_MIRROR=https://gh-proxy.com scripts/fetch-l10n-cache.sh   # 走镜像
#   L10N_FORCE=1 scripts/fetch-l10n-cache.sh                        # 忽略缓存强制重下
#
# 环境变量：
#   L10N_MIRROR    镜像前缀（拼在原 URL 前面），如 https://gh-proxy.com
#   L10N_FORCE=1   强制重下
#   L10N_RETRIES   最多下载轮数（默认 6）
# ============================================================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CACHE="$REPO_ROOT/.cache/l10n"
ZIP="$CACHE/l10n.zip"
EXTRACTED="$CACHE/firefox-l10n-main"
UPSTREAM="https://codeload.github.com/mozilla-l10n/firefox-l10n/zip/refs/heads/main"
SRC="${L10N_MIRROR:+${L10N_MIRROR%/}/}$UPSTREAM"
RETRIES="${L10N_RETRIES:-6}"
FORCE="${L10N_FORCE:-}"

say()  { printf '\033[1;32m>>> %s\033[0m\n' "$*"; }
warn() { printf '\033[1;33m!!! %s\033[0m\n' "$*"; }
die()  { printf '\033[1;31mxxx %s\033[0m\n' "$*" >&2; exit 1; }

# zip 完整性：能读出中央目录 = 完整（源不给 content-length，这是唯一可靠判据）
zip_ok() { [ -s "${1:-}" ] && unzip -tq "$1" >/dev/null 2>&1; }
lang_count() { find "$1" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l; }

mkdir -p "$CACHE"

# ---------- 1) 下载（zip 完整就跳过，这是唯一要联网的步骤） ----------
if [ -z "$FORCE" ] && zip_ok "$ZIP"; then
  say "l10n.zip 已就绪，跳过下载：$(du -h "$ZIP" | cut -f1)"
else
  # 下载器：aria2c > curl > wget
  # 源站不支持 Range ⇒ 断点续传/多连接都无效，aria2 有意只用单连接；
  # 它真正的价值是 --lowest-speed-limit（低速自动断链重连），治「慢到卡住」。
  download() {
    local out="$1"
    rm -f "$out"
    if command -v aria2c >/dev/null 2>&1; then
      say "下载器：aria2c（单连接 + 低速断链保护）"
      aria2c -x1 -s1 --continue=false --allow-overwrite=true --auto-file-renaming=false \
             --max-tries=5 --retry-wait=5 --timeout=30 --connect-timeout=15 \
             --lowest-speed-limit=20K --summary-interval=30 \
             -d "$CACHE" -o "$(basename "$out")" "$SRC"
    elif command -v curl >/dev/null 2>&1; then
      say "下载器：curl（-f + 重试 + 低速保护）"
      curl -fL --retry 5 --retry-all-errors --retry-delay 5 \
           --connect-timeout 15 --speed-limit 20480 --speed-time 60 \
           -o "$out" "$SRC"
    elif command -v wget >/dev/null 2>&1; then
      say "下载器：wget（-c 在原站无效，只能整包重试）"
      wget -O "$out" --tries=5 --timeout=30 --waitretry=5 "$SRC"
    else
      die "curl / wget / aria2c 都没有，无法下载"
    fi
  }

  ok=0
  for i in $(seq 1 "$RETRIES"); do
    say "第 ${i}/${RETRIES} 轮下载：$SRC"
    download "$ZIP" || warn "本轮下载进程非零退出"
    if zip_ok "$ZIP"; then ok=1; break; fi
    sz="$(du -h "$ZIP" 2>/dev/null | cut -f1)"; sz="${sz:-无文件}"
    warn "包不完整（当前 $sz），丢弃重试"
    rm -f "$ZIP"
  done
  [ "$ok" = 1 ] || die "连续 $RETRIES 轮都没拿到完整包，请换 L10N_MIRROR 或检查网络"
  say "完整包 OK：$(du -h "$ZIP" | cut -f1)"
fi

# ---------- 2) 解压（幂等；只为了缓存完整，构建时脚本还会自己再解一次） ----------
if [ -n "$FORCE" ] || [ ! -d "$EXTRACTED" ]; then
  say "解压 → $EXTRACTED"
  TMP="$CACHE/.unpack.$$"
  rm -rf "$TMP"; mkdir -p "$TMP"
  unzip -qo "$ZIP" -d "$TMP"
  [ -d "$TMP/firefox-l10n-main" ] || die "zip 顶层不是 firefox-l10n-main（上游结构变了？）"
  rm -rf "$EXTRACTED"
  mv "$TMP/firefox-l10n-main" "$EXTRACTED"
  rm -rf "$TMP"
else
  say "解压目录已存在，跳过"
fi

say "完成 ✅  语言目录 $(lang_count "$EXTRACTED") 个"
echo "    接着跑 make dir 即可；zip 完整时 librewolf-patches.py 不会再联网下载。"
