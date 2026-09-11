#!/usr/bin/env bash
# ==========================================
# Vantage - 拉取 Mozilla 官方 PGO profile（复用，免自建 instrumented 构建）
#
# 原理：Mozilla 发布版用 PGO；其 CI 会把生成好的 merged.profdata 作为公开制品
#       （profdata.tar.xz）发布在 Taskcluster 上。--enable-profile-use 只「喂数据」、
#       不运行二进制，因此交叉编译的 Windows / macOS 也能直接用。
#
# 用法:
#   ./scripts/fetch-pgo-profile.sh <目标>     # 目标名同 build.sh: linux-x64 / windows-x64 ...
#   ./scripts/fetch-pgo-profile.sh win64      # 也可直接给平台名
#
# 产物: ~/.cache/vantage-pgo/<平台>/merged.profdata
#   mozconfig 以 $HOME/.cache/vantage-pgo/<平台>/merged.profdata 引用；
#   ⚠️ 文件缺失时 mozconfig 会自动跳过 PGO（便于随时回退，构建不受影响）。
# 说明: 缓存在 $HOME 下（不在仓库/workspace 内），CI 每次清空 workspace 也不会重下。
#
# 环境变量:
#   VANTAGE_PGO_BRANCH   上游分支（默认 mozilla-esr153）
#   VANTAGE_PGO_CACHE    缓存目录（默认 $HOME/.cache/vantage-pgo）
#   VANTAGE_PGO_FORCE=1  已存在也强制重新拉取
# ==========================================
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ESR_BRANCH="${VANTAGE_PGO_BRANCH:-mozilla-esr153}"
CACHE_DIR="${VANTAGE_PGO_CACHE:-$HOME/.cache/vantage-pgo}"
TC_INDEX="https://firefox-ci-tc.services.mozilla.com/api/index/v1/task"
TC_QUEUE="https://firefox-ci-tc.services.mozilla.com/api/queue/v1/task"

# build.sh 目标名 → 上游 job-name（平台）
case "${1:-}" in
  linux64|linux-x64)            platform="linux64" ;;
  win64|windows-x64)            platform="win64" ;;
  win64-aarch64|windows-arm64)  platform="win64-aarch64" ;;
  macosx64|macos-x64)           platform="macosx64" ;;
  macosx64-aarch64|macos-arm64) platform="macosx64-aarch64" ;;
  linux-arm64|linux64-aarch64|linux-loong64|loong64)
    echo "ℹ️  ${1}: Mozilla 未发布官方 PGO profile，跳过（该平台保持纯 LTO）"
    exit 0 ;;
  *) echo "未知目标: '${1:-}'（见脚本内映射表）" >&2; exit 2 ;;
esac

dest_dir="$CACHE_DIR/$platform"
dest="$dest_dir/merged.profdata"
index_route="gecko.v2.$ESR_BRANCH.latest.firefox.$platform-profile"

if [ -f "$dest" ] && [ "${VANTAGE_PGO_FORCE:-0}" != "1" ]; then
  echo "✅ PGO profile 已存在: $dest ($(du -h "$dest" | cut -f1))"
  exit 0
fi

command -v curl >/dev/null 2>&1 || { echo "❌ 缺少 curl" >&2; exit 1; }
command -v jq   >/dev/null 2>&1 || { echo "❌ 缺少 jq" >&2; exit 1; }

mkdir -p "$dest_dir"
echo ">>> 解析 PGO 任务: $index_route"
task_id="$(curl -fsSL --retry 5 --retry-all-errors --connect-timeout 20 "$TC_INDEX/$index_route" | jq -r '.taskId // empty')"
if [ -z "$task_id" ]; then
  echo "❌ 无法解析任务 id（index route: $index_route）" >&2
  exit 1
fi
echo "    taskId: $task_id"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

url="$TC_QUEUE/$task_id/artifacts/public/build/profdata.tar.xz"
echo ">>> 下载 profdata.tar.xz ..."
if command -v aria2c >/dev/null 2>&1; then
  aria2c -q --allow-overwrite=true --auto-file-renaming=false \
    -x 16 -s 16 -k 1M -d "$tmp" -o profdata.tar.xz "$url"
else
  curl -fSL --retry 3 -o "$tmp/profdata.tar.xz" "$url"
fi

echo ">>> 解压 merged.profdata ..."
tar -xJf "$tmp/profdata.tar.xz" -C "$tmp"
src_file="$(find "$tmp" -name merged.profdata -type f | head -1)"
if [ -z "$src_file" ]; then
  echo "❌ 归档中未找到 merged.profdata" >&2
  exit 1
fi
mv "$src_file" "$dest"
echo "✅ PGO profile 就绪: $dest ($(du -h "$dest" | cut -f1))"
