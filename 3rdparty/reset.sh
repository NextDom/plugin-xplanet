#!/bin/bash
echo "########### Reset ##########"
echo Arrêt des services en cours :
echo `ls /etc/init.d/xplanet-service-*`
echo `sudo service xplanet-service-* stop`
echo `sudo service xplanet-service-* status`

echo PPID supprimés :
echo `ps -afe | grep xplanet | awk '{print $3}'`
sudo kill -9 `ps -afe | grep xplanet | awk '{print $3}'`

echo PID supprimés :
echo `ps aux | grep xplanet | awk '{print $2}'`
sudo kill -9 `ps aux | grep xplanet | awk '{print $2}'`

echo Pensez à activer à nouveau vos services
echo en sauvegardant les configurations que vous souhaitez relancer parmi :
echo `ls /etc/init.d/xplanet-service-*`

echo Services zombies, doit être vide :
echo `ps aux | grep xplanet`

echo "########### Fin ##########"
