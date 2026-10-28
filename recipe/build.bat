@echo on

:: Header name used by the patched lshpack.h on Windows
copy compat\queue\sys\queue.h lshpack_queue.h
if errorlevel 1 exit 1

cmake -B _build -G Ninja %CMAKE_ARGS% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
    -DSHARED=1 ^
    -DLSHPACK_XXH=1 ^
    .
if errorlevel 1 exit 1
cmake --build _build
if errorlevel 1 exit 1

copy _build\ls-hpack.dll %LIBRARY_BIN%\
if errorlevel 1 exit 1
copy _build\ls-hpack.lib %LIBRARY_LIB%\
if errorlevel 1 exit 1
copy lshpack.h %LIBRARY_INC%\
if errorlevel 1 exit 1
copy lshpack_queue.h %LIBRARY_INC%\
if errorlevel 1 exit 1
copy lsxpack_header.h %LIBRARY_INC%\
if errorlevel 1 exit 1
