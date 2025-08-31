#!/bin/bash
set -e
source dependencies.sh
echo "Downloading BYOND version $BYOND_MAJOR.$BYOND_MINOR"
curl -fSL "http://www.byond.com/download/build/$BYOND_MAJOR/$BYOND_MAJOR.${BYOND_MINOR}_byond.zip" -o byond.zip
if [ $? -ne 0 ]; then
  echo "BYOND download failed!"
  exit 1
fi
echo "BYOND zip file details:"
ls -lh byond.zip
