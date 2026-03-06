#!/usr/bin/bash
set -eu

if [ $# -ne 1 ]; then
  echo "Usage: $0 <path to patch>"
  exit 1
fi

if [ "$1" == "${1%.patch}" ]; then
  echo "Error: '$1' does not seem to be a patch."
  exit 1
fi

cd "$(dirname "$0")/.."
version="$(cat version)"

if [ -d "firefox-$version" ]; then
  echo "-> Removing old 'firefox-$version'"
  rm -rf "firefox-$version"
fi

echo "-> Extracting 'firefox-$version.source.tar.xz'"
make "firefox-$version.source.tar.xz"
tar xf "firefox-$version.source.tar.xz"
cd "firefox-$version"

echo "-> Setting up git"
git init
files="$(cat ../$1 | grep '+++ b/' | sed 's/\+\+\+ b\///')"
echo "$files" | xargs touch
echo "$files" | xargs git add

echo "-> Trying to apply patch"
rejects="$(patch -p1 -i "../$1" | tee /dev/stderr | sed -r --quiet 's/^.*saving rejects to file (.*\.rej)$/\1/p')"

echo "-> Done. You can now fix the patch. If you are done, press enter to"
echo "   update the patch with your changes or Ctrl+C to abort."
echo "$rejects" | xargs code &
read

echo "-> Updating patch"
sed -i '/^[^#]/d' "../$1"
git diff | sed '/^diff --git /,+1 d' >>"../$1"
sed -i '1{/^$/d}' "../$1"

echo "-> Cleaning up"
cd ..
rm -rf "firefox-$version"
