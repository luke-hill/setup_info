apt-get remove -y virtualbox-guest-x11
apt-get remove -y virtualbox-guest-dkms
apt-get remove -y virtualbox-guest-utils
reboot
wget https://download.virtualbox.org/virtualbox/6.1.2/VBoxGuestAdditions_6.1.2.iso
mkdir /media/iso
mount VBoxGuestAdditions_6.1.2.iso /media/iso -o loop
/media/iso/VBoxLinuxAdditions.run
yes
reboot
