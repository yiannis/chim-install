cd
mkdir -p incoming
mkdir -p src

cd incoming/
wget 'ftp://ftp.unidata.ucar.edu/pub/netcdf/old/netcdf-fortran-4.2.tar.gz'

cd ~/src/
tar xf ~/incoming/netcdf-fortran-4.2.tar.gz
cd netcdf-fortran-4.2

export CC='gcc-4.8'
export CXX='g++-4.8'
export FC='gfortran-4.8'
export F77='gfortran-4.8'

export CFLAGS='-O -m64 -mcmodel=medium'
export LDFLAGS='-O -g -fno-second-underscore -mcmodel=medium'
export CPPFLAGS='-DNDEBUG -DgFortran'
export FCFLAGS='-O -g -m64 -fno-second-underscore -mcmodel=medium'
export FFLAGS='-O -g -m64 -fno-second-underscore -mcmodel=medium'

./configure
make && ldconfig && make check && make install

