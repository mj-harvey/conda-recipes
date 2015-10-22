mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DPYTHON_BINDINGS=on \
  -DRUN_SWIG=on \
  -DPYTHON_INCLUDE_DIR="$(dirname $(which python))/../include/python*/" \
  -DPYTHON_LIBRARIES="$(dirname $(which python))/../lib/libpython3.so" \
  -DZLIB_LIBRARY="$(dirname $(which python))/../lib/libz.so" \
  -DBUILD_GUI=off

make -j 4
make install
