if not exist %LIBRARY_PREFIX% mkdir %LIBRARY_PREFIX%
if errorlevel 1 exit 1

if not exist %LIBRARY_BIN% mkdir %LIBRARY_BIN%
if errorlevel 1 exit 1

if not exist %LIBRARY_LIB% mkdir %LIBRARY_LIB%
if errorlevel 1 exit 1

if not exist %LIBRARY_INC% mkdir %LIBRARY_INC%
if errorlevel 1 exit 1

%PYTHON% configure.py --bootstrap
if errorlevel 1 exit 1

COPY ninja.exe %LIBRARY_BIN%\ninja.exe
if errorlevel 1 exit 1
