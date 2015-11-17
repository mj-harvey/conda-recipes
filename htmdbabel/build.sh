mkdir build
cd build
pwd

PYTHONDIR="$(dirname $(which python))/../"

printenv
SUFFIX=so
if [ "$OSX_ARCH" != "" ]; then
	SUFFIX="dylib"
fi
echo $SUFFIX

touch "$PREFIX"/bin/roundtrip

cmake .. -DCMAKE_INSTALL_PREFIX="$PREFIX" \
  -DPYTHON_BINDINGS=off \
  -DZLIB_LIBRARY="$PYTHONDIR/lib/libz.$SUFFIX" \
  -DBUILD_GUI=off \
  -DBUILD_SHARED=off \
  -DBUILD_MIXED=on  \
  -DCMAKE_OSX_DEPLOYMENT_TARGET="" \
  -DENABLE_TESTS=off \
#  -DRUN_SWIG=on \
#  -DPYTHON_INCLUDE_DIR="$PYTHONDIR/include/python3.4m/" \
#  -DPYTHON_LIBRARIES="$PYTHONDIR/lib/libpython3.$SUFFIX" \


printenv

make -j 4
make install
mv "$PREFIX/bin/babel" "$PREFIX/bin/htmd_babel"
rm "$PREFIX/bin/roundtrip"

