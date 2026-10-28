#!/bin/bash
set -euxo pipefail

cmake -B _build -G Ninja ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DSHARED=1 -DLSHPACK_XXH=1 .
cmake --build _build
cmake --install _build
