./_autosetup

./configure --prefix "$SP_DIR" --disable-server --disable-manager
make
make install
