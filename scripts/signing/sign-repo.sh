#!/bin/bash
# Vantage Repository Signing Script
# Usage:
#   ./scripts/signing/sign-repo.sh /path/to/repo-root
#
# Expected structure:
#   repo-root/
#     pool/              ← throw .deb/.rpm here
#     dists/stable/      ← apt metadata (generated)
#     vantage-el9/       ← RPM repo (generated)
#
# GPG key: 907587D2812D7F8C (Vantage Browser <repo@vantage.asystech.cn>)
# Public key: keys/vantage-archive-keyring.asc

set -euo pipefail

GPG_KEY="907587D2812D7F8C"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log()  { echo -e "${GREEN}[+]${NC} $*"; }
warn() { echo -e "${RED}[!]${NC} $*"; }

if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/repo-root"
    exit 1
fi

REPO_ROOT="$1"

if [ ! -d "$REPO_ROOT" ]; then
    warn "Repo root not found: $REPO_ROOT"
    exit 1
fi

# Check GPG key exists
if ! gpg --list-secret-keys "$GPG_KEY" &>/dev/null; then
    warn "GPG key $GPG_KEY not found. Import it first:"
    warn "  gpg --import vantage-repo-private-key.asc"
    exit 1
fi

DEB_COUNT=$(find "$REPO_ROOT/pool" -name '*.deb' 2>/dev/null | wc -l)
RPM_COUNT=$(find "$REPO_ROOT/pool" -name '*.rpm' 2>/dev/null | wc -l)
log "Found $DEB_COUNT .deb(s), $RPM_COUNT .rpm(s) in pool/"

# ─────────────────────────────────────────────
# APT Repository
# ─────────────────────────────────────────────
if [ "$DEB_COUNT" -gt 0 ]; then
    log "=== Building APT repository ==="

    DIST_DIR="$REPO_ROOT/dists/stable"
    mkdir -p "$DIST_DIR"/main/binary-amd64 \
             "$DIST_DIR"/main/binary-arm64 \
             "$DIST_DIR"/main/binary-loong64

    # Map deb arches to pool dirs
    for deb in "$REPO_ROOT/pool"/*.deb; do
        [ -f "$deb" ] || continue
        if   [[ "$deb" =~ _amd64\.deb$ ]]; then   ARCH_DIR="$DIST_DIR/main/binary-amd64"
        elif [[ "$deb" =~ _arm64\.deb$ ]]; then   ARCH_DIR="$DIST_DIR/main/binary-arm64"
        elif [[ "$deb" =~ _loong64\.deb$ ]]; then ARCH_DIR="$DIST_DIR/main/binary-loong64"
        else
            warn "Unknown arch for $deb, skipping"
            continue
        fi
        cp "$deb" "$ARCH_DIR/"
        log "  APT: $(basename "$deb") → $(basename "$ARCH_DIR")/"
    done

    # Generate Packages files
    for arch_dir in "$DIST_DIR"/main/binary-*; do
        [ -d "$arch_dir" ] || continue
        arch=$(basename "$arch_dir" | sed 's/binary-//')
        pushd "$arch_dir" > /dev/null
        dpkg-scanpackages -m . /dev/null > Packages
        gzip -9c Packages > Packages.gz
        log "  Packages + Packages.gz generated for $arch"
        popd > /dev/null
    done

    # Generate Release
    pushd "$DIST_DIR" > /dev/null
    apt-ftparchive release . > Release
    log "  Release generated"

    # Sign: InRelease (clearsign, modern) + Release.gpg (detached, legacy)
    gpg --armor --detach-sign --sign-with "$GPG_KEY" \
        -o Release.gpg Release
    gpg --armor --clearsign --sign-with "$GPG_KEY" \
        -o InRelease Release
    log "  APT repo signed ✓"
    popd > /dev/null
fi

# ─────────────────────────────────────────────
# RPM Repository
# ─────────────────────────────────────────────
if [ "$RPM_COUNT" -gt 0 ]; then
    log "=== Building RPM repository ==="

    # Sign each RPM individually
    for rpm in "$REPO_ROOT/pool"/*.rpm; do
        [ -f "$rpm" ] || continue
        log "  Signing: $(basename "$rpm")"
        rpmsign --addsign --signfiles \
            --fskpath <(gpg --export-secret-key "$GPG_KEY" 2>/dev/null) \
            "$rpm" 2>/dev/null || {
            # Fallback: use gpg directly
            rpm --resign "$rpm" 2>/dev/null || {
                warn "  Could not sign $rpm with rpmsign, trying alternative..."
                # Use rpmsign with default GPG keyring
                rpmsign --addsign "$rpm" 2>/dev/null || warn "  ⚠ RPM signing skipped for $rpm (rpmsign not available)"
            }
        }
    done

    # Detect distro versions from RPM filenames
    # Group by dist (el8, el9, fc40, fc41, etc.)
    declare -A RPM_DISTS
    for rpm in "$REPO_ROOT/pool"/*.rpm; do
        [ -f "$rpm" ] || continue
        if [[ "$rpm" =~ \.el[0-9]+ ]]; then
            dist=$(echo "$rpm" | grep -oP '\.el\d+')
        elif [[ "$rpm" =~ \.fc[0-9]+ ]]; then
            dist=$(echo "$rpm" | grep -oP '\.fc\d+')
        else
            dist=".generic"
        fi
        RPM_DISTS["$dist"]=1
    done

    for dist in "${!RPM_DISTS[@]}"; do
        DIST_DIR="$REPO_ROOT/vantage${dist}"
        mkdir -p "$DIST_DIR"
        # Copy matching RPMs
        for rpm in "$REPO_ROOT/pool"/*.rpm; do
            [ -f "$rpm" ] || continue
            # Match dist or copy all if generic
            [[ "$dist" == ".generic" || "$rpm" == *"${dist}."* || "$rpm" == *"${dist}.noarch"* ]] && \
                cp "$rpm" "$DIST_DIR/"
        done
        pushd "$DIST_DIR" > /dev/null
        createrepo_c . 2>/dev/null || createrepo . 2>/dev/null || {
            warn "  createrepo not found, skipping RPM metadata"
            popd > /dev/null
            continue
        }
        log "  RPM repo ($dist) created and signed ✓"
        popd > /dev/null
    done
fi

echo ""
log "Done! Repo layout:"
echo "  $REPO_ROOT/"
echo "  ├── pool/                           ← source .deb/.rpm files"
echo "  ├── dists/stable/                   ← APT repo"
echo "  │   ├── Release / InRelease / Release.gpg"
echo "  │   └── main/binary-{amd64,arm64,loong64}/"
echo "  └── vantage{el9,fc41,...}/          ← RPM repos"

echo ""
log "Users install with:"
echo ""
echo "  # APT (Debian/Ubuntu)"
echo "  curl -fsSL https://your-server/vantage-archive-keyring.asc | sudo apt-key add -"
echo "  echo 'deb https://your-server/repo stable main' | sudo tee /etc/apt/sources.list.d/vantage.list"
echo "  sudo apt update && sudo apt install vantage"
echo ""
echo "  # RPM (Fedora)"
echo "  sudo rpm --import https://your-server/vantage-archive-keyring.asc"
echo "  sudo dnf config-manager --add-repo https://your-server/vantage.repo"
echo "  sudo dnf install vantage"
