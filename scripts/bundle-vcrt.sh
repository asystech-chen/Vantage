#!/usr/bin/env bash
# Bundle MSVC runtime DLLs into a Windows app directory (portable package).
# Idempotent: skips DLLs already present. Uses the same MSVC Redist lookup as
# assets/mozconfig.win-cross (--with-redist). Once --with-redist is fixed,
# dist/bin already contains these DLLs (build/win32/moz.build), so this is a
# safety net rather than the primary mechanism.
#
# Usage: ./scripts/bundle-vcrt.sh <app-dir>
set -euo pipefail

DEST="${1:?usage: bundle-vcrt.sh <app-dir>}"
[ -d "$DEST" ] || { echo "❌ 目标目录不存在: $DEST"; exit 1; }

REDIST="$(ls -d "$HOME/.mozbuild/vs/VC/Redist/MSVC"/*/x64/Microsoft.VC*.CRT 2>/dev/null | sort -V | tail -1 || true)"
if [ -z "$REDIST" ]; then
  echo "⚠️ 未找到 MSVC Redist CRT 目录，跳过 VC++ DLL 捆绑"
  exit 0
fi

COPIED=0
for dll in vcruntime140.dll vcruntime140_1.dll msvcp140.dll msvcp140_atomic_wait.dll; do
  if [ -f "$REDIST/$dll" ]; then
    if [ ! -f "$DEST/$dll" ]; then
      cp -v "$REDIST/$dll" "$DEST/"
      COPIED=$((COPIED + 1))
    fi
  else
    echo "  (Redist 中无 $dll，跳过)"
  fi
done
echo "✅ VC++ DLL 捆绑完成（新增 $COPIED 个）"
