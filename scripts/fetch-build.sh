#!/usr/bin/env bash

set -e

fetch_and_extract() {
    rm -rf version source_release
    wget -q -O version "https://codeberg.org/librewolf/source/raw/branch/main/version"
    wget -q -O source_release "https://codeberg.org/librewolf/source/raw/branch/main/release"
    
    rm -f "librewolf-$(cat version)-$(cat source_release).source.tar.gz"
    wget -O "librewolf-$(cat version)-$(cat source_release).source.tar.gz" "https://codeberg.org/api/packages/librewolf/generic/librewolf-source/$(cat version)-$(cat source_release)/librewolf-$(cat version)-$(cat source_release).source.tar.gz"
    
    rm -rf librewolf-$(cat version)
    tar xf librewolf-$(cat version)-$(cat source_release).source.tar.gz

    # here would be a great spot to insert system dependent stuff like mozconfig/patches.
}

build() {
    cd librewolf-$(cat version)
      ./mach build
      ./mach package
    cd ..
}

artifacts() {
    # ... Here we do system dependent stuff like builing rpm's, setup.exe or other formats we distribute in
}

build_all() {
    fetch_and_extract
    build
    artifacts
}

build_all
