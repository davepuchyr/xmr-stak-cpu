#!/bin/bash

if [ -x ./build/bin/xmr-stak-cpu ]; then
   true;
else
   mkdir build;
   ( cd build && rm -f CMakeCache.txt && cmake -DMICROHTTPD_ENABLE=OFF -DCMAKE_BUILD_TYPE=Release .. && make -j6 );
fi

nice ./build/bin/xmr-stak-cpu debt.config.txt

