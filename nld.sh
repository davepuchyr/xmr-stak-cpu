#!/bin/bash

if [ -x ./build/bin/xmr-stak-cpu ]; then
   true;
else
   mkdir build;
   ( cd build && rm -f CMakeCache.txt && cmake -DMICROHTTPD_ENABLE=OFF -DCMAKE_BUILD_TYPE=Release .. && make -j6 );
fi

sudo sysctl -w vm.nr_hugepages=128

nice ./build/bin/xmr-stak-cpu nld.config.txt

