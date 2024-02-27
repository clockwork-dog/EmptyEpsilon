#!/bin/bash

mkdir -p _build
cd _build
cmake .. -DCMAKE_INSTALL_PREFIX=. -DSERIOUS_PROTON_DIR=../../SeriousProton/ 
make \
    && make install \
    && EmptyEpsilon.app/Contents/MacOS/EmptyEpsilon
