#!/bin/bash
cd "$(dirname "$0")"
echo "########### Suppression du service ##########"
if [ -f /etc/init.d/xplanet-service-$1 ]; then
    sudo service xplanet-service-$1 stop
    sudo update-rc.d xplanet-service-$1 remove
    sudo systemctl daemon-reload
    sudo rm -Rf /etc/xplanet/xplanet-$1.conf
    sudo rm -Rf $2/xplanet-$1/img/
fi
echo "########### Fin ##########"
