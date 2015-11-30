#!/bin/sh

D="$SP_DIR/../../../"
mkdir -p "$D/lib"

cp -r  /apps/intel/2015.3//lib/intel64/libi*.so "$D/lib/"
cp -r  /apps/intel/2015.3/mkl/lib/intel64/*.so "$D/lib/"

