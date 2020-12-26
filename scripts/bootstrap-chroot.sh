sudo mkdir /mnt/data/chimere-chroot
sudo debootstrap --variant=minbase bionic /mnt/data/chimere-chroot http://archive.ubuntu.com/ubuntu/
cat /etc/apt/sources.list | grep -vi docker | sudo tee /mnt/data/chimere-chroot/etc/apt/sources.list > /dev/null
sudo cp scripts/inside-chroot-install.sh /mnt/data/chimere-chroot/root/
