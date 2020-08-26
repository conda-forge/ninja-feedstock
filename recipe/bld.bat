#!/bin/bash

mkdir -p build
cd build

cmake -D CMAKE_BUILD_TYPE:STRING="Release" ^
      -D CMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
      ..

make install