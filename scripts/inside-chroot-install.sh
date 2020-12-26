apt-get update
apt-get install lbzip2 vim make wget
apt-get install gcc-4.8 g++-4.8 gfortran-4.8

cd
mkdir incoming
mkdir src

cd incoming/
wget https://download.open-mpi.org/release/open-mpi/v1.6/openmpi-1.6.5.tar.bz2
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.4/src/hdf5-1.10.4.tar.bz2

cd ~/src/
tar xf ~/incoming/openmpi-1.6.5.tar.bz2 
cd openmpi-1.6.5
./configure CC=gcc-4.8 CXX=g++-4.8 F77=gfortran-4.8 FC=gfortran-4.8 CFLAGS=-m64 CXXFLAGS=-m64 FFLAGS=-m64 FCFLAGS=-m64 --with-mpi-f90-size=medium
make -j4
make install
ldconfig
ompi_info | head

apt-get remove hdf5-helpers libhdf5-100 libhdf5-cpp-100
cd ~/src/
tar xf ~/incoming/hdf5-1.10.4.tar.bz2 
cd hdf5-1.10.4/
export CC='gcc-4.8'
export CXX='g++-4.8'
export FC='gfortran-4.8'
export F77='gfortran-4.8'
ldconfig
./configure --prefix=/usr/local --enable-fortran --enable-parallel

