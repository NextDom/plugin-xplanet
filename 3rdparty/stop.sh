#!/bin/bash
echo "########### Arrêt du service ##########"
sudo service xplanet-service-$1 stop
echo "########### Fin ##########"
