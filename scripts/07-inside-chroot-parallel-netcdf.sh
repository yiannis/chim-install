cd
mkdir -p incoming
mkdir -p src

cd incoming/
wget 'https://parallel-netcdf.github.io/Release/parallel-netcdf-1.4.1.tar.gz'

apt-get install bison flex

cd ~/src/
tar xf ~/incoming/parallel-netcdf-1.4.1.tar.gz
cd parallel-netcdf-1.4.1

./configure
make && make install

