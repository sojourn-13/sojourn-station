#!/usr/bin/env bash
set -euo pipefail

source dependencies.sh

mkdir -p ~/.byond/bin
cp tools/ci/librust_g_v3.2.0_ci.so ~/.byond/bin/librust_g.so
chmod +x ~/.byond/bin/librust_g.so
ldd ~/.byond/bin/librust_g.so
