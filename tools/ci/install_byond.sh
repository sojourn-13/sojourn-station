#!/bin/bash
set -euo pipefail

source dependencies.sh

echo "BYOND_MAJOR: $BYOND_MAJOR"
echo "BYOND_MINOR: $BYOND_MINOR"
echo "Using local BYOND zip: tools/ci/515.1647_byond_linux.zip"

if [ -d "$HOME/BYOND/byond/bin" ] && grep -Fxq "${BYOND_MAJOR}.${BYOND_MINOR}" $HOME/BYOND/version.txt;
then
  echo "Using cached directory."
else
  echo "Setting up BYOND."
  rm -rf "$HOME/BYOND"
  mkdir -p "$HOME/BYOND"
  cd "$HOME/BYOND"
  # Use path from repo root
  if [ ! -f "$GITHUB_WORKSPACE/tools/ci/515.1647_byond_linux.zip" ]; then
    echo "$GITHUB_WORKSPACE/tools/ci/515.1647_byond_linux.zip not found! Please provide it."
    exit 1
  fi
  cp "$GITHUB_WORKSPACE/tools/ci/515.1647_byond_linux.zip" byond.zip
  echo "byond.zip size:"
  ls -lh byond.zip
  echo "byond.zip checksum:"
  sha256sum byond.zip
  if [ $(stat -c%s "byond.zip") -lt 10000 ]; then
    echo "byond.zip is too small, likely a failed download."
    exit 1
  fi
  unzip -l byond.zip || { echo "byond.zip is not a valid zip file!"; exit 1; }
  unzip byond.zip
  rm byond.zip
  cd byond
  make here
  echo "$BYOND_MAJOR.$BYOND_MINOR" > "$HOME/BYOND/version.txt"
  cd ~/
fi
