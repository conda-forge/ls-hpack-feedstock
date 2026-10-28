@echo on

cmake -B _build -G Ninja %CMAKE_ARGS% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS=ON ^
    -DSHARED=1 ^
    -DLSHPACK_XXH=1 ^
    .
if errorlevel 1 exit 1
cmake --build _build
if errorlevel 1 exit 1
cmake --install _build
if errorlevel 1 exit 1
