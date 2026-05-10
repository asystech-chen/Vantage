#!/bin/bash
# Vantage - Replace Firefox-branded 7zSFX stubs with Vantage-branded ones
# Run this after 'make dir' and before 'mach package' for Windows builds.
#
# Usage: ./setup-7zsfx.sh [path/to/librewolf-xxx/]

set -e

SRC_DIR="${1:-$(ls -d librewolf-*/ 2>/dev/null | head -1)}"
ASSET_DIR="$(cd "$(dirname "$0")/assets/7zsfx" && pwd)"

if [ -z "$SRC_DIR" ]; then
    echo "Error: No librewolf source directory found."
    echo "Usage: ./setup-7zsfx.sh [path/to/librewolf-xxx/]"
    exit 1
fi

TARGET_DIR="$SRC_DIR/other-licenses/7zstub/firefox"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory not found: $TARGET_DIR"
    echo "Run 'make dir' first."
    exit 1
fi

echo ">>> Vantage 7zSFX branding fix"

for ARCH in Win32 ARM64; do
    src="$ASSET_DIR/7zSD.${ARCH}.sfx"
    dst="$TARGET_DIR/7zSD.${ARCH}.sfx"

    if [ ! -f "$src" ]; then
        echo "⚠️  Patched $ARCH .sfx not found at $src — regenerate with:"
        echo "   python3 patch-7zsfx.py <original.sfx> $src"
        continue
    fi

    # Backup original if not already backed up
    if [ ! -f "${dst}.firefox-backup" ]; then
        cp "$dst" "${dst}.firefox-backup"
        echo "   Backed up original: ${ARCH}"
    fi

    cp "$src" "$dst"
    echo "   Patched: ${ARCH}"
done

echo "✅ Done. Windows installer will now use Vantage branding."
