#!/bin/bash

mkdir -p "${PREFIX}"
mkdir -p "${PREFIX}/bin"
mkdir -p "${PREFIX}/include"
mkdir -p "${PREFIX}/lib"

if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
    ./configure.py
    ninja
else
    ./configure.py --bootstrap
fi

cp -p ninja "$PREFIX/bin/ninja"
