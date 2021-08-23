#!/bin/bash

# Get an updated config.sub and config.guess
cp -r ${BUILD_PREFIX}/share/libtool/build-aux/config.* ./config

set -euo pipefail

./configure --prefix=$PREFIX --with-libpq=$PREFIX/lib --enable-pthreads
make -j${CPU_COUNT}
make install
# generate the driver inst files
python $RECIPE_DIR/generate_odbc_inst_template.py
