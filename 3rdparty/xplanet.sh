#!/bin/bash
ln -s $2/snapshot_$3.jpg /usr/share/nginx/www/jeedom/snapshot_$3.jpg
chown www-data:www-data /usr/share/nginx/www/jeedom/snapshot_$3.jpg

url=""
if [ $8 != '' ]
then
  url="$8:$9@"
fi
complement=$(echo "$6" | sed 's/&/\\&/')    # substitute to escape the ampersand
while sleep $5
do
avconv -i rtsp://$url$1:$4$complement -s $7 -frames:v 1 -an -y $2/snapshot_$3.jpg
done
