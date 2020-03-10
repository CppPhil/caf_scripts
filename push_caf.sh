#!/bin/bash

function catch_errors() {
    printf "\npush_caf.sh failed!\n" >&2
    exit 1
}

trap catch_errors ERR;

clang-format -i libcaf_core/src/logger.cpp

./configure --build-type=Debug --no-examples --no-python --with-log-level=TRACE --with-actor-profiler --with-runtime-checks
cd build
make -j$(nproc)
cd ..

git add .
git commit
git push

exit 0

