#!/bin/bash
cd "$(dirname "$0")"
echo "########### Création/Mise à jour du service ##########"
if [ -f /etc/init.d/xplanet-service-$1 ]; then
    echo "Service already exist for $1, replace it"
    sudo service xplanet-service-$1 stop
    sudo update-rc.d -f xplanet-service-$1 remove
    sudo rm -Rf /etc/init.d/xplanet-service-$1
fi
sudo cp xplanet-service /etc/init.d/xplanet-service-$1
sudo cp xplanet.conf /etc/xplanet/xplanet-$1.conf

#cd /etc/init.d/
sudo sed -i "s|\@\@name\@\@|$1|g" /etc/init.d/xplanet-service-$1
sudo sed -i "s|\@\@targetFolder\@\@|$2|g" /etc/init.d/xplanet-service-$1
sudo sed -i "s|\@\@targetFolder\@\@|$2|g" /etc/xplanet/xplanet-$1.conf
sudo sed -i "s|\@\@body\@\@|$3|g" /etc/init.d/xplanet-service-$1
sudo sed -i "s|\@\@delay\@\@|$4|g" /etc/init.d/xplanet-service-$1
sudo sed -i "s|\@\@size\@\@|$5|g" /etc/init.d/xplanet-service-$1

sudo mkdir -p $2/xplanet-$1/img/
sudo chown -Rf www-data:www-data $2/xplanet-$1/img/
sudo chmod +x /etc/init.d/xplanet-service-$1
sudo update-rc.d xplanet-service-$1 defaults
sudo systemctl daemon-reload
sudo service xplanet-service-$1 start
echo "########### Fin ##########"
