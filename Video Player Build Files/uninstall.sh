#!/bin/sh

rpi-rw

apt-get remove -y omxplayer

#stop service
service videoPlayer stop
rm /etc/init.d/videoPlayer

rm -R /usr/local/bin/streamplayer

rm /home/pi/url.conf

rm /usr/bin/rpi-ro
rm /usr/bin/rpi-rw

cp /etc/default/rcS.orig /etc/default/rcS
cp /etc/fstab.orig /etc/fstab



