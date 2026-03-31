#!/bin/bash
#
# rebrand.sh - 合并 LibreWolf 上游后，自动将路径相关的 LibreWolf 引用替换为 Vantage
#
# 用法: 拉取 LibreWolf 上游更新后，运行 ./scripts/rebrand.sh
#
# 只替换影响用户数据路径的内容，不动 pref key、注释、URL、内部资源文件名
#

set -euo pipefail
cd "$(dirname "$0")/.."

echo "=== Vantage Rebrand Script ==="
echo ""

# --- patches/moz-configure.patch ---
echo "[1/3] patches/moz-configure.patch"
sed -i \
  -e 's/default="LibreWolf"/default="Vantage"/' \
  -e 's/default="librewolf"/default="vantage"/' \
  patches/moz-configure.patch
echo "  MOZ_APP_VENDOR -> Vantage, MOZ_APP_PROFILE -> vantage"

# --- patches/mozilla_dirs.patch ---
echo "[2/3] patches/mozilla_dirs.patch"
sed -i \
  -e 's/"LibreWolf"_ns/"Vantage"_ns/g' \
  -e 's/"\.librewolf"_ns/".vantage"_ns/g' \
  -e 's|/librewolf/extensions|/vantage/extensions|g' \
  -e 's/"LibreWolf"/"Vantage"/g' \
  -e 's/"\.librewolf"/".vantage"/g' \
  patches/mozilla_dirs.patch
echo "  All hardcoded dir paths -> Vantage/.vantage"

# --- settings/librewolf.cfg (overrides.cfg 加载路径) ---
echo "[3/3] settings/librewolf.cfg"
sed -i \
  -e 's|\.includes("\.librewolf")|.includes(".vantage")|g' \
  -e 's|librewolf/librewolf/librewolf\.overrides\.cfg|vantage/vantage/vantage.overrides.cfg|g' \
  -e 's|\.librewolf/librewolf\.overrides\.cfg|.vantage/vantage.overrides.cfg|g' \
  settings/librewolf.cfg
echo "  overrides.cfg paths -> .vantage/vantage.overrides.cfg"

echo ""
echo "=== Done. Verify with: ==="
echo "  grep -in 'librewolf' patches/moz-configure.patch patches/mozilla_dirs.patch"
echo "  grep -n 'overrides' settings/librewolf.cfg"
