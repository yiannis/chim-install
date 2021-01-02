sudo mkdir /mnt/data/chimere-chroot
sudo debootstrap --variant=minbase bionic /mnt/data/chimere-chroot http://archive.ubuntu.com/ubuntu/
cat /etc/apt/sources.list | grep -vi docker | sudo tee /mnt/data/chimere-chroot/etc/apt/sources.list > /dev/null

sudo cp files/nc4internal.h /mnt/data/chimere-chroot/root/
sudo cp files/mychimere-ubuntu-18.04 /mnt/data/chimere-chroot/root/
