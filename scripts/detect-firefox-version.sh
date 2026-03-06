#!/bin/bash
#
# detect-firefox-version.sh
#
# Detects the preferred Firefox version for CI testing based on channel selection.
#

set -e

CHANNEL="latest"

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --channel)
            CHANNEL="$2"
            shift 2
            ;;
        *)
            echo "Unknown argument: $1" >&2
            exit 1
            ;;
    esac
done

# API endpoints
PRODUCT_DETAILS_URL="https://product-details.mozilla.org/1.0/firefox_versions.json"
ARCHIVE_BASE="https://archive.mozilla.org/pub/firefox"
CANDIDATES_URL="${ARCHIVE_BASE}/candidates"
RELEASES_URL="${ARCHIVE_BASE}/releases"

# Fetch current version info
echo "Fetching Firefox version info..." >&2
VERSION_DATA=$(curl -s "$PRODUCT_DETAILS_URL")

STABLE_VERSION=$(echo "$VERSION_DATA" | jq -r '.LATEST_FIREFOX_VERSION')
BETA_VERSION=$(echo "$VERSION_DATA" | jq -r '.LATEST_FIREFOX_DEVEL_VERSION')

echo "Current stable: $STABLE_VERSION" >&2
echo "Current beta: $BETA_VERSION" >&2

# Extract major version number
get_major_version() {
    echo "$1" | cut -d'.' -f1
}

# Check if a URL exists
url_exists() {
    curl -s --head --fail "$1" > /dev/null 2>&1
}

# Find the latest build number for a candidate
find_latest_build() {
    local version="$1"
    local candidates_dir="${CANDIDATES_URL}/${version}-candidates/"
    
    # Fetch directory listing and find highest buildN
    local builds=$(curl -s "$candidates_dir" 2>/dev/null | grep -oE 'build[0-9]+' | sort -V | tail -1)
    
    if [[ -n "$builds" ]]; then
        echo "$builds"
    else
        echo ""
    fi
}

# Find the latest beta 
find_latest_beta() {
    local major="$1"
    local latest_beta=""
    local latest_beta_num=0
    
    # Check beta versions from b1 to b15
    # Might wanna find a better way to do this?
    for i in $(seq 1 15); do
        local beta_version="${major}.0b${i}"
        local source_url="${CANDIDATES_URL}/${beta_version}-candidates/"
        
        if url_exists "$source_url"; then
            latest_beta="$beta_version"
            latest_beta_num=$i
        fi
    done
    
    echo "$latest_beta"
}

# Find RC for a given major version
find_rc() {
    local major="$1"
    local rc_version="${major}.0"
    local candidates_dir="${CANDIDATES_URL}/${rc_version}-candidates/"
    
    if url_exists "$candidates_dir"; then
        local build=$(find_latest_build "$rc_version")
        if [[ -n "$build" ]]; then
            # Verify the tarball exists
            local source_url="${candidates_dir}${build}/source/firefox-${rc_version}.source.tar.xz"
            if url_exists "$source_url"; then
                echo "$rc_version"
                return
            fi
        fi
    fi
    echo ""
}

# Output results
output_result() {
    local version="$1"
    local channel="$2"
    local build="$3"
    local beta_suffix="$4"
    local display="$5"
    
    echo "FF_VERSION=${version}"
    echo "FF_CHANNEL=${channel}"
    echo "FF_BUILD=${build}"
    echo "FF_BETA_SUFFIX=${beta_suffix}"
    echo "FF_DISPLAY=${display}"
}

# Main selecton based on channel
case "$CHANNEL" in
    stable)
        echo "Using stable channel..." >&2
        output_result "$STABLE_VERSION" "releases" "" "" "Firefox ${STABLE_VERSION} (Stable)"
        ;;
    
    beta)
        echo "Using beta channel..." >&2
        # Get the beta version from API
        if [[ -n "$BETA_VERSION" && "$BETA_VERSION" != "null" ]]; then
            # Extract version and beta suffix (e.g., "148.0b3" -> "148.0" and "b3")
            BASE_VERSION=$(echo "$BETA_VERSION" | sed 's/b[0-9]*$//')
            BETA_SUFFIX=$(echo "$BETA_VERSION" | grep -oE 'b[0-9]+$')
            BUILD=$(find_latest_build "$BETA_VERSION")
            [[ -z "$BUILD" ]] && BUILD="build1"
            output_result "$BASE_VERSION" "beta" "$BUILD" "$BETA_SUFFIX" "Firefox ${BETA_VERSION} (Beta)"
        else
            echo "Error: No beta version available" >&2
            exit 1
        fi
        ;;
    
    rc)
        echo "Using RC channel..." >&2
        TARGET_MAJOR=$(($(get_major_version "$STABLE_VERSION") + 1))
        RC_VERSION=$(find_rc "$TARGET_MAJOR")
        
        if [[ -n "$RC_VERSION" ]]; then
            BUILD=$(find_latest_build "$RC_VERSION")
            [[ -z "$BUILD" ]] && BUILD="build1"
            output_result "$RC_VERSION" "candidates" "$BUILD" "" "Firefox ${RC_VERSION} (RC)"
        else
            echo "Error: No RC version available for ${TARGET_MAJOR}.0" >&2
            exit 1
        fi
        ;;
    
    latest)
        echo "Using latest channel..." >&2
        
        # Calculate target major version (stable + 1)
        STABLE_MAJOR=$(get_major_version "$STABLE_VERSION")
        TARGET_MAJOR=$((STABLE_MAJOR + 1))
        
        echo "Target major version: $TARGET_MAJOR" >&2
        
        # Check for RC
        RC_VERSION=$(find_rc "$TARGET_MAJOR")
        if [[ -n "$RC_VERSION" ]]; then
            echo "Found RC: $RC_VERSION" >&2
            BUILD=$(find_latest_build "$RC_VERSION")
            [[ -z "$BUILD" ]] && BUILD="build1"
            output_result "$RC_VERSION" "candidates" "$BUILD" "" "Firefox ${RC_VERSION} (RC)"
            exit 0
        fi

        # Check for beta
        LATEST_BETA=$(find_latest_beta "$TARGET_MAJOR")
        if [[ -n "$LATEST_BETA" ]]; then
            echo "Found beta: $LATEST_BETA" >&2
            BASE_VERSION=$(echo "$LATEST_BETA" | sed 's/b[0-9]*$//')
            BETA_SUFFIX=$(echo "$LATEST_BETA" | grep -oE 'b[0-9]+$')
            BUILD=$(find_latest_build "$LATEST_BETA")
            [[ -z "$BUILD" ]] && BUILD="build1"
            output_result "$BASE_VERSION" "beta" "$BUILD" "$BETA_SUFFIX" "Firefox ${LATEST_BETA} (Beta)"
            exit 0
        fi
        
        # Fallback: Use current stable
        echo "No beta or RC found for version $TARGET_MAJOR, falling back to stable" >&2
        output_result "$STABLE_VERSION" "releases" "" "" "Firefox ${STABLE_VERSION} (Stable - Fallback)"
        ;;
    
    *)
        echo "Error: Unknown channel '$CHANNEL'. (latest, beta, rc, or stable)" >&2
        exit 1
        ;;
esac
