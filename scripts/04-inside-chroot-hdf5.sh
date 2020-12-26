cd
mkdir -p incoming
mkdir -p src

cd incoming/
wget https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.4/src/hdf5-1.10.4.tar.bz2

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

make || exit 1
make install || exit 1

cp -af hdf5/lib/* /usr/local/lib/
cp hdf5/include/* /usr/local/include/
cp hdf5/bin/* /usr/local/bin/

