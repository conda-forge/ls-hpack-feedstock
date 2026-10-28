#!/bin/bash
set -euxo pipefail

cmake -B _build -G Ninja ${CMAKE_ARGS} -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DSHARED=1 -DLSHPACK_XXH=1 .
cmake --build _build
install -d ${PREFIX}/lib ${PREFIX}/include
install -m 644 _build/libls-hpack${SHLIB_EXT} ${PREFIX}/lib/
install -m 644 lshpack.h ${PREFIX}/include/
install -m 644 lsxpack_header.h ${PREFIX}/include/
