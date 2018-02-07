#!/bin/bash
cd "$(dirname "$0")"
echo "########### Installation en cours ##########"
sudo apt-get update
sudo apt-get -y install xplanet graphicsmagick-imagemagick-compat
sudo ln -s $(dirname "$0")/xplanet-cloud.sh /usr/sbin/xplanet-cloud.sh
sudo chmod 777 xplanet-cloud.sh
echo "########### Fin ##########"
