cd
mkdir -p incoming
mkdir -p src

cd incoming/
wget https://download.open-mpi.org/release/open-mpi/v1.6/openmpi-1.6.5.tar.bz2

cd ~/src/
tar xf ~/incoming/openmpi-1.6.5.tar.bz2 
cd openmpi-1.6.5
./configure CC=gcc-4.8 CXX=g++-4.8 F77=gfortran-4.8 FC=gfortran-4.8 CFLAGS=-m64 CXXFLAGS=-m64 FFLAGS=-m64 FCFLAGS=-m64 --with-mpi-f90-size=medium
make
make install
ldconfig
ompi_info | head
