wget http://ab-initio.mit.edu/nlopt/nlopt-2.4.2.tar.gz
tar -zxvf nlopt-2.4.2.tar.gz
cd nlopt-2.4.2
./configure --with-python --enable-shared --prefix="$PREFIX"
printenv

make -j 4
make install

