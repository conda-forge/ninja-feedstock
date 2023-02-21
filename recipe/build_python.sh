#!/usr/bin/env bash

set -ex

cp -r "${RECIPE_DIR}/python" ./_python

cat > "./_python/setup.cfg" <<EOF
[metadata]
name = ninja
version = ${PKG_VERSION}
[options]
packages = find:
EOF

"${PYTHON}" -m pip install "./_python" -v --no-deps
