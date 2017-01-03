#!/bin/bash

#File location /home/pi/
StreamUrl=`cat /home/pi/url.conf`

#echo "$StreamUrl"

while true; do
if pgrep omxplayer > /dev/null
then
        echo 'omxplayer running'

else
        #/usr/bin/omxplayer -b --live rtsp://184.72.239.149/vod/mp4:BigBuckBunny_175k.mov
        sleep 1
        /usr/bin/omxplayer -b --live "$StreamUrl"
fi
done


