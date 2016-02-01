. /etc/profile.d/module.sh

for S in 6.5 7.0; do
	module unload cuda
	module load cuda/$S

	mkdir  -p $PREFIX/lib
	cp -par $CUDA_HOME/lib64/libcuda*so* $PREFIX/lib
	cp -par $CUDA_HOME/lib64/libcufft*so* $PREFIX/lib
	cp -par $CUDA_HOME/lib64/libcublas*so* $PREFIX/lib
	chmod -R a+rX $PREFIX/lib/*
done
