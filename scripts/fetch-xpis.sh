#!/usr/bin/env bash
# Download optional extension XPIs for the Windows installer.
# Run from Vantage repo root.

set -e

XPI_DIR="${1:-settings/distribution/optional-extensions}"
mkdir -p "$XPI_DIR"

# Extension download URLs (must be direct XPI links)
declare -A XPI_URLS
XPI_URLS["idcac-pub@guus.ninja"]="https://addons.mozilla.org/firefox/downloads/file/4637154/istilldontcareaboutcookies-1.1.9.xpi"

for id in "${!XPI_URLS[@]}"; do
    url="${XPI_URLS[$id]}"
    dest="$XPI_DIR/${id}.xpi"
    if [ -f "$dest" ]; then
        echo "Already exists: $dest"
    else
        echo "Downloading: $id -> $dest"
        curl -sL -o "$dest" "$url"
        echo "  OK ($(du -h "$dest" | cut -f1))"
    fi
done

echo "Done. XPIs in $XPI_DIR/"
ls -la "$XPI_DIR/"
