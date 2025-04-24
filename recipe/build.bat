@echo on

mkdir build
cd build

cmake -G "NMake Makefiles" ^
      %CMAKE_ARGS% ^
      -DBUILD_TESTING=OFF ^
      %SRC_DIR%
if errorlevel 1 exit 1

cmake --build . --config Release
if errorlevel 1 exit 1

cmake --build . --target install
if errorlevel 1 exit 1
