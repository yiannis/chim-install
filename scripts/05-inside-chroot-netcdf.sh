cd
mkdir -p incoming
mkdir -p src

apt-get install zlib1g-dev m4

cd incoming/
wget 'https://github.com/Unidata/netcdf-c/archive/v4.3.1.1.tar.gz'

cd ~/src/
tar xf ~/incoming/v4.3.1.1.tar.gz
cd netcdf-c-4.3.1.1
cp /root/nc4internal.h include/

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
make && ldconfig && make install

