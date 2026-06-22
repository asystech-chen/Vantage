#!/usr/bin/env bash
# Download optional extension XPIs for the Windows installer.
# Run from Vantage repo root.

set -e

XPI_DIR="${1:-settings/distribution/optional-extensions}"
mkdir -p "$XPI_DIR"

# Extension download URLs (must be direct XPI links)
declare -A XPI_URLS
XPI_URLS["idcac-pub@guus.ninja"]="https://addons.mozilla.org/firefox/downloads/file/4637154/istilldontcareaboutcookies-1.1.9.xpi"
XPI_URLS["{9350bc42-47fb-4598-ae0f-825e3dd9ceba}"]="https://addons.mozilla.org/firefox/downloads/file/4274207/absolute_enable_right_click-1.3.9resigned1.xpi"
XPI_URLS["{b184d107-461b-4cfe-b4ba-771406e90c48}"]="https://addons.mozilla.org/firefox/downloads/file/4274183/912887-1.1resigned1.xpi"
XPI_URLS["easyscreenshot@mozillaonline.com"]="https://addons.mozilla.org/firefox/downloads/file/4049242/easyscreenshot-3.109.xpi"

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
