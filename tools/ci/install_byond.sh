#!/bin/bash
set -euo pipefail

source dependencies.sh

echo "BYOND_MAJOR: $BYOND_MAJOR"
echo "BYOND_MINOR: $BYOND_MINOR"
DOWNLOAD_URL="https://www.byond.com/download/build/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip"
echo "Download URL: $DOWNLOAD_URL"

if [ -d "$HOME/BYOND/byond/bin" ] && grep -Fxq "${BYOND_MAJOR}.${BYOND_MINOR}" $HOME/BYOND/version.txt;
then
  echo "Using cached directory."
else
  echo "Setting up BYOND."
  rm -rf "$HOME/BYOND"
  mkdir -p "$HOME/BYOND"
  cd "$HOME/BYOND"
  echo "Downloading BYOND from: $DOWNLOAD_URL"
  curl -fSL "$DOWNLOAD_URL" -o byond.zip || { echo "BYOND download failed (HTTP error, likely 403). Check BYOND_MAJOR and BYOND_MINOR, and ensure the version is available."; exit 22; }
  if [ ! -f byond.zip ]; then
    echo "byond.zip not found! Download failed."
    exit 1
  fi
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
