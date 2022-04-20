:: cmd


:: Isolate the build.
mkdir Build-%PKG_NAME%
cd Build-%PKG_NAME%
if errorlevel 1 exit /b 1


:: Generate the build files.
echo "Generating the build files."
cmake .. %CMAKE_ARGS% ^
      -G"NMake Makefiles" ^
      -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -DCMAKE_BUILD_TYPE=Release


:: Build.
echo "Building..."
nmake
if errorlevel 1 exit /b 1


:: Perform tests.
echo "Testing..."
ctest -VV --output-on-failure
if errorlevel 1 exit /b 1


:: Install.
echo "Installing..."
nmake install
if errorlevel 1 exit /b 1


:: Error free exit.
echo "Error free exit!"
exit 0
