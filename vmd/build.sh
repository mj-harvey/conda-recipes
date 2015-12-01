printenv

FILE=http://www.ks.uiuc.edu/Research/vmd/vmd-1.9.2/files/final/vmd-1.9.2.bin.LINUXAMD64.opengl.tar.gz

if [ ! -e /tmp/vmd.tar ] ; then
	curl $FILE > /tmp/vmd.tar 
fi

tar -xf /tmp/vmd.tar
cd vmd-1.9.2

export INSTALLDIR="$SP_DIR/../../../"

../configure.mjh
cd src
make install

