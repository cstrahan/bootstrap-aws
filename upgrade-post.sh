sudo apt-get -q -y update

# Remove any old headers
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

sudo apt-get -y install linux-image-extra-`uname -r`
sudo apt-get -y install linux-headers-generic

sudo reboot
sleep 60
