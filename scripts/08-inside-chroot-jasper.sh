cd
mkdir -p incoming
mkdir -p src

cd incoming/
wget 'https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.1.zip'

apt-get install unzip

cd ~/src/
unzip ~/incoming/jasper-1.900.1.zip
cd jasper-1.900.1/

export CC='gcc-4.8'
export CXX='g++-4.8'

export CFLAGS='-O -m64 -mcmodel=medium'
export LDFLAGS='-O -g -fno-second-underscore -mcmodel=medium'

./configure
make && make install

# In https://www.ece.uvic.ca/~frodo/jasper/jasper.pdf,
# 2.4.3 Dependencies on Other Software
# it says that http://www.ijg.org/ is needed if we want
# JPEG support - not sure if that is the case...
