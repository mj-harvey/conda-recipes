if [ ! -e "repo/boinc" ]; then
	mkdir -p repo
	cd repo
	git clone --depth 1 https://github.com/BOINC/boinc
  cd ..
fi
pwd
cd repo/boinc
git pull
if [ ! -e "configure" ]; then
	./_autosetup
fi
if [ ! -e config.log ]; then
	./configure --prefix "$SP_DIR" --disable-server --disable-manager --disable-fcgi  --disable-client --enable-shared LDFLAGS="-lssl -lcrypto" CFLAGS="-fPIC" CXXFLAGS="-fPIC"
fi
make
echo "Installing into $SP_DIR"
cp -r ../../boinc "$SP_DIR"
find . -name "*.so" -exec cp {} "$SP_DIR/boinc" \; -print

