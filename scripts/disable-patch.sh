#!/usr/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <patchfile>"
  exit 1
fi

sed -i "\#${1/./\.}#d" assets/patches.txt
