wget http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz
tar -zxvf autodock_vina_1_1_2_linux_x86.tgz
mkdir "$PREFIX/bin"
cp autodock_vina_1_1_2_linux_x86/bin/vina* "$PREFIX/bin"
