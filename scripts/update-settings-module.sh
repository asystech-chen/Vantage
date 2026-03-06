#!/usr/bin/env bash

set -eu

cd settings
git checkout master
git pull origin master
cd ..

git add settings
git commit -m "Updated settings submodule to the latest version"
git push
