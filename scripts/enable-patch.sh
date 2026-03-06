#!/usr/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <patchfile>"
  exit 1
fi

if grep -q "$1" assets/patches.txt; then
  echo "Patch already enabled"
  exit 1
fi

echo "$1" >>assets/patches.txt
sort assets/patches.txt -o assets/patches.txt
