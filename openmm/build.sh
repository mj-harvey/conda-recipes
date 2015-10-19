mkdir build
cd build
. /etc/profile.d/module.sh 

module load cuda/7.0
cmake .. -DCMAKE_INSTALL_PREFIX=$PREFIX \
 -DOPENMM_BUILD_OPENCL_LIB=ON \
 -DOPENMM_BUILD_CUDA_LIB=ON \
 -DOPENMM_BUILD_AMOEBA_CUDA_LIB=ON \
 -DOPENMM_BUILD_CUDA_COMPILER_PLUGIN=ON \
 -DCUDA_SEPARABLE_COMPILATION=ON \
 -DOPENMM_BUILD_DRUDE_CUDA_LIB=ON \
 -DOPENMM_BUILD_DRUDE_OPENCL_LIB=ON \
 -DOPENMM_BUILD_PME_PLUGIN=OFF \
 -DOPENMM_BUILD_PYTHON_WRAPPERS=ON

make -j 8
make install
make PythonInstall

