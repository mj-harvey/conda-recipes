#!/bin/sh

D="$SP_DIR/../../../"
mkdir -p "$D/lib"

cp -p  /apps/intel/2015.3/composer_xe_2015.3.187/compiler/lib/intel64/libintlc.so.5 "$D/lib"
cp -r  /apps/intel/2015.3//lib/intel64/libi*.so "$D/lib/"
cp -r  /apps/intel/2015.3//lib/intel64/libsvml.so "$D/lib/"
cp -r  /apps/intel/2015.3/mkl/lib/intel64/*.so "$D/lib/"

