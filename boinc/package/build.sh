#XX="$PWD"
#
#if [ ! -e "/tmp/repo/boinc" ]; then
#	mkdir -p /tmp/repo
#	cd /tmp/repo
#	git clone --depth 1 https://github.com/BOINC/boinc
#  cd ..
#fi
#pwd
#cd /tmp/repo/boinc
#git pull
#if [ ! -e "configure" ]; then
#  echo "x"
#	./_autosetup
#fi
#if [ ! -e config.log ]; then
#  echo "x"
#	./configure --prefix "$SP_DIR" --disable-server --disable-manager --disable-fcgi  --disable-client --enable-shared LDFLAGS="-lssl -lcrypto" CFLAGS="-fPIC" CXXFLAGS="-fPIC"
#fi
#make
#echo "Installing into $SP_DIR"
#mkdir -p "$SP_DIR/boinc"
#gcc --shared -o "$SP_DIR/boinc/libboinc.so" lib/*.o
cd ..
pwd
ls -la
cp -r boinc "$SP_DIR"

