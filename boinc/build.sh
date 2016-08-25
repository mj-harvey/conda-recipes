if [ ! -e "repo/boinc" ]; then
	mkdir -p repo
	cd repo
	git clone --depth 1 https://github.com/BOINC/boinc
  cd ..
fi
pwd
cd repo/boinc
git pull
./_autosetup
./configure --prefix "$SP_DIR" --disable-server --disable-manager --disable-fcgi  --disable-client --enable-shared LDFLAGS="-lssl -lcrypto" CFLAGS="-fPIC" CXXFLAGS="-fPIC"
make
make install

cp -r boinc "$SP_DIR"

