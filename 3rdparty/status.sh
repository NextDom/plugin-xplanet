#!/bin/bash
echo "########### Etat du service $1 ##########"
echo `sudo service xplanet-service-$1 status`
echo "########### Fin ##########"
