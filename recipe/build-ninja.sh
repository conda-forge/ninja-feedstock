#!/bin/bash


# Isolate the build.
mkdir -p Build-${PKG_NAME}
cd Build-${PKG_NAME} || exit 1


# Generate the build files.
echo "Generating the build files."
cmake .. ${CMAKE_ARGS} \
      -G"Unix Makefiles" \
      -DCMAKE_PREFIX_PATH=$PREFIX \
      -DCMAKE_INSTALL_PREFIX=$PREFIX \
      -DCMAKE_BUILD_TYPE=Release \


# Build.
echo "Building..."
make  -j${CPU_COUNT} || exit 1


# Perform tests.
echo "Testing..."
ctest -VV --output-on-failure || exit 1


# Installing
echo "Installing..."
make install || exit 1


# Error free exit!
echo "Error free exit!"
exit 0
