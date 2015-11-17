VERSION=linux_x86
if [ "$MACOSX_DEPLOYMENT_TARGET" != "" ]; then
  VERSION=mac
fi
printenv
if [ ! -e x.tgz ]; then
	curl -L http://vina.scripps.edu/download/autodock_vina_1_1_2_${VERSION}.tgz > x.tgz
fi
tar -zxvf x.tgz
mkdir -p "$PREFIX/bin"
ls -lR autodock*
cp autodock_vina_1_1_2_${VERSION}/bin/vina* "$PREFIX/bin"
chmod a+rX "$PREFIX"/bin/vina*
