#!/bin/sh

path=/tmp/xplanet/img/ # destination de l'image téléchargée
apacheDirectory=/var/www/html/core
nginxDirectory=/usr/share/nginx/www/jeedom

if [ ! -d "$path" ]; then
  mkdir -p $path
fi

if [ -d "$apacheDirectory" ]; then
  # if [ ! -e "/var/www/html/plugins/xplanet/3rdparty/land_ocean_ice_2048.jpg" ]; then
  #   wget -t 4 -P /var/www/html/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/land_ocean_ice_2048.jpg
  # fi
  # if [ ! -e "/var/www/html/plugins/xplanet/3rdparty/land_shallow_topo_2048.jpg" ]; then
  #   wget -t 4 -P /var/www/html/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/land_shallow_topo_2048.jpg
  # fi
  # if [ ! -e "/var/www/html/plugins/xplanet/3rdparty/night_jk.jpg" ]; then
  #   wget -t 4 -P /var/www/html/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/night_jk.jpg
  # fi
  chmod 666 /var/www/html/plugins/xplanet/3rdparty/backgrounds/*.jpg
  chown www-data:www-data /var/www/html/plugins/xplanet/3rdparty/backgrounds/*.jpg
fi

if [ -d "$nginxDirectory" ]; then
  # if [ ! -e "/usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/land_ocean_ice_2048.jpg" ]; then
  #   wget -t 4 -P /usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/land_ocean_ice_2048.jpg
  # fi
  # if [ ! -e "/usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/land_shallow_topo_2048.jpg" ]; then
  #   wget -t 4 -P /usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/land_shallow_topo_2048.jpg
  # fi
  # if [ ! -e "/usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/night_jk.jpg" ]; then
  #   wget -t 4 -P //usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/ http://flatplanet.sourceforge.net/maps/images/night_jk.jpg
  # fi
  chmod 666 /usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/backgrounds/*.jpg
  chown www-data:www-data /usr/share/nginx/www/jeedom/plugins/xplanet/3rdparty/backgrounds/*.jpg
fi

wget -t 4 -P $path http://xplanet.sourceforge.net/clouds/clouds_2048.jpg # télécharge l'image
if [ ! -e $path/clouds_2048.jpg ] ; then
  wget -t 4 -O http://xplanetclouds.com/free/local/clouds_2048.jpg
fi
