#!/bin/sh
. /etc/profile.d/module.sh
module load cmake cuda/6.5
printenv
if [ ! -e gromacs.tgz ]; then
curl ftp://ftp.gromacs.org/pub/gromacs/gromacs-5.1.1.tar.gz > gromacs.tgz
tar -zxf gromacs.tgz
fi
mkdir build
cd build
mkdir -p "$SP_DIR"
cmake ../gromacs-5.1.1  -DGMX_BUILD_OWN_FFTW=ON -DGMX_GPU=ON -DGMX_COOL_QUOTES=OFF -DBUILD_SHARED_LIBS=OFF -DGMX_SIMD=SSE4.1 -DCMAKE_INSTALL_PREFIX="$SP_DIR/../../.."
make -j 8 
make install
rm -rf "$SP_DIR/../../../include"
rm -rf "$SP_DIR/../../../lib64"
rm -rf "$SP_DIR/../../../share/man"
cp "$CUDA_HOME/lib64/libcudart.so.6.5" "$SP_DIR/../../../lib/"

cd "$SP_DIR/../../../bin"
mv gmx gmx.bin
echo '#!/bin/sh

DIR=$(readlink -f $(dirname "$0"))
export GMXDATA="$DIR/share/gromacs"
export LD_LIBRARY_PATH="$DIR/lib:$LD_LIBRARY_PATH"
"$DIR/gmx.bin" "$@"
' >> gmx
chmod +x gmx

