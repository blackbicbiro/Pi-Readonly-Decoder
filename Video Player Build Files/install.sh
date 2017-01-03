#!/bin/sh

apt-get update


echo "bcm2708_wdog" | sudo tee -a /etc/modules

apt-get install -y omxplayer screen watchdog

#fix autostart of watchdog
ln /lib/systemd/system/watchdog.service /etc/systemd/system/multi-user.target.wants/watchdog.service

echo "watchdog-device = /dev/watchdog" | sudo tee -a /etc/watchdog.conf
echo "watchdog-timeout = 10" | sudo tee -a /etc/watchdog.conf
echo "nterval = 2" | sudo tee -a /etc/watchdog.conf
echo "max-load-1 = 5" | sudo tee -a /etc/watchdog.conf


#edit fstab file
cp /etc/default/rcS /etc/default/rcS.orig
sh -c "echo 'RAMTMP=yes' >> /etc/default/rcS"
mv /etc/fstab /etc/fstab.orig
sh -c "echo 'tmpfs           /tmp            tmpfs   nodev,nosuid,size=30M,mode=1777       0    0' >> /etc/fstab"
sh -c "echo 'tmpfs           /var/log        tmpfs   nodev,nosuid,size=30M,mode=1777       0    0' >> /etc/fstab"
sh -c "echo 'proc            /proc           proc    defaults                              0    0' >> /etc/fstab"
sh -c "echo '/dev/mmcblk0p1  /boot           vfat    defaults                              0    2' >> /etc/fstab"
sh -c "echo '/dev/mmcblk0p2  /               ext4    defaults,ro,noatime,errors=remount-ro 0    1' >> /etc/fstab"
sh -c "echo ' ' >> /etc/fstab"
mv /etc/mtab /etc/mtab.orig
ln -s /proc/self/mounts /etc/mtab


#copy files to right locations
cp scripts/readme.txt /home/pi/readme.txt	

cp scripts/rpi-ro /usr/bin/rpi-ro
chmod 755 /usr/bin/rpi-ro

cp scripts/rpi-rw /usr/bin/rpi-rw
chmod 755 /usr/bin/rpi-rw

cp scripts/url.conf /home/pi/url.conf


mkdir /usr/local/bin/streamplayer
cp scripts/streamPlayer.sh /usr/local/bin/streamplayer/streamPlayer.sh
chmod 755 /usr/local/bin/streamplayer/streamPlayer.sh



#Copy init script and update init and start service
cp scripts/videoPlayer /etc/init.d/videoPlayer
chmod 755 /etc/init.d/videoPlayer
update-rc.d videoPlayer defaults
service videoPlayer start




