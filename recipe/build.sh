#!/bin/bash

set -ex # Abort on error.

mkdir build
cd build

cmake -G "Unix Makefiles" \
      ${CMAKE_ARGS} \
      -DBUILD_TESTING=OFF \
      ${SRC_DIR}

cmake --build . -j ${CPU_COUNT} --config Release
cmake --build . --target install
