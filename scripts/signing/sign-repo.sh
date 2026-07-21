#!/bin/bash
# Vantage Repository Signing Script
# Usage:
#   ./scripts/signing/sign-repo.sh /path/to/repo-root
#
# Expected structure:
#   repo-root/
#     pool/              ← throw .deb/.rpm here
#     dists/stable/      ← APT metadata (generated)
#     rpm/               ← RPM repo (generated, all distros)
#
# GPG key: 907587D2812D7F8C (Vantage Browser <repo@vantage.asystech.cn>)
#   Override for third-party repos:  GPG_KEY=YOUR_ID ./scripts/signing/sign-repo.sh ...
# Public key: keys/vantage-archive-keyring.asc

set -euo pipefail

# GPG_KEY can be overridden via environment for third-party repos
GPG_KEY="${GPG_KEY:-907587D2812D7F8C}"
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

# Check GPG key (warn if missing — third parties can bring their own)
HAS_GPG_KEY=false
if gpg --list-secret-keys "$GPG_KEY" &>/dev/null; then
    HAS_GPG_KEY=true
else
    warn "GPG key $GPG_KEY not found in keyring."
    warn "  APT Release signing and RPM repo signing will be skipped."
    warn "  To use Vantage official key: gpg --import vantage-repo-private-key.asc"
    warn "  To use your own key:  GPG_KEY=YOUR_KEY_ID ./scripts/signing/sign-repo.sh ..."
    echo ""
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

    # Sign Release (if GPG key available)
    if $HAS_GPG_KEY; then
        gpg --armor --detach-sign --sign-with "$GPG_KEY" \
            -o Release.gpg Release
        gpg --armor --clearsign --sign-with "$GPG_KEY" \
            -o InRelease Release
        log "  APT repo signed ✓"
    else
        warn "  APT repo NOT signed (no GPG key)"
    fi
    popd > /dev/null
fi

# ─────────────────────────────────────────────
# RPM Repository
# ─────────────────────────────────────────────
# Note: RPM packages are expected to be pre-signed (build.sh does this).
# This script only generates repo metadata (signed by createrepo_c).
if [ "$RPM_COUNT" -gt 0 ]; then
    log "=== Building RPM repository ==="

    # Ensure rpm macros for createrepo signing
    if ! grep -q '%_gpg_name' ~/.rpmmacros 2>/dev/null; then
        echo '%_signature gpg' >> ~/.rpmmacros
        echo "%_gpg_name Vantage Browser <repo@vantage.asystech.cn>" >> ~/.rpmmacros
    fi

    RPM_DIR="$REPO_ROOT/rpm"
    mkdir -p "$RPM_DIR"

    # Copy pre-signed RPMs as-is (no re-signing)
    for rpm in "$REPO_ROOT/pool"/*.rpm; do
        [ -f "$rpm" ] || continue
        cp "$rpm" "$RPM_DIR/"
        log "  Copied: $(basename "$rpm")"
    done

    # Generate repo metadata (createrepo_c signs repodata with GPG)
    pushd "$RPM_DIR" > /dev/null
    if command -v createrepo_c >/dev/null 2>&1; then
        createrepo_c .
        log "  RPM repo metadata generated (createrepo_c) ✓"
    elif command -v createrepo >/dev/null 2>&1; then
        createrepo .
        log "  RPM repo metadata generated (createrepo) ✓"
    else
        warn "  createrepo_c not found. Install: apt install createrepo-c"
        warn "  RPM repo metadata NOT generated"
    fi
    popd > /dev/null
fi

echo ""
log "Done! Repo layout:"
echo "  $REPO_ROOT/"
echo "  ├── pool/                           ← source .deb/.rpm files"
echo "  ├── dists/stable/                   ← APT repo"
echo "  │   ├── Release / InRelease / Release.gpg"
echo "  │   └── main/binary-{amd64,arm64,loong64}/"
echo "  └── rpm/                            ← RPM repo (all distros)"
echo "      └── repodata/                   ← createrepo_c metadata"

echo ""
log "Users install with:"
echo ""
echo "  # APT (Debian/Ubuntu)"
echo "  curl -fsSL https://your-server/vantage-archive-keyring.asc | sudo tee /etc/apt/trusted.gpg.d/vantage.asc"
echo "  echo 'deb [signed-by=/etc/apt/trusted.gpg.d/vantage.asc] https://your-server/repo stable main' | sudo tee /etc/apt/sources.list.d/vantage.list"
echo "  sudo apt update && sudo apt install vantage"
echo ""
echo "  # RPM (Fedora/RHEL)"
echo "  sudo rpm --import https://your-server/vantage-archive-keyring.asc"
echo "  sudo tee /etc/yum.repos.d/vantage.repo <<'EOF'"
echo "  [vantage]"
echo "  name=Vantage Browser"
echo "  baseurl=https://your-server/repo/rpm"
echo "  enabled=1"
echo "  gpgcheck=1"
echo "  gpgkey=https://your-server/vantage-archive-keyring.asc"
echo "  EOF"
echo "  sudo dnf install vantage"
