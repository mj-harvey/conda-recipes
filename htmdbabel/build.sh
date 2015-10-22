mkdir build
cd build

PYTHONDIR="$(dirname $(which python))/../"

cmake .. -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DPYTHON_BINDINGS=on \
  -DRUN_SWIG=on \
  -DPYTHON_INCLUDE_DIR="$PYTHONDIR/include/python3.4m/" \
  -DPYTHON_LIBRARIES="$PYTHONDIR/lib/libpython3.so" \
  -DZLIB_LIBRARY="$PYTHONDIR/lib/libz.so" \
  -DBUILD_GUI=off \
  -DBUILD_SHARED=off \
  -DBUILD_MIXED=on 

printenv

make -j 4
make install
mv "$PREFIX/bin/babel" "$PREFIX/bin/htmd_babel"
rm "$PREFIX/bin/roundtrip"

