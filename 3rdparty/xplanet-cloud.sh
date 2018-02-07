#!/bin/sh

pat=/tmp/xplanet/img/ # destination de l'image téléchargée
tmp=$pat"tmp_clouds_2048.jpg" # nom du fichier temporaire
img=$pat"clouds_2048.jpg"     # nom du fichier final

rm $tmp # supprimer l'ancien fichier temporaire

wget -O $tmp http://xplanet.sourceforge.net/clouds/clouds_2048.jpg # télécharge l'image

if [ -f $tmp ] ; then # si le fichier a bien été téléchargée...
  mogrify -resize 2000x1000 $tmp # redimenssionne l'image téléchargée pour qu'elle est la même résolution que la map "jour"
  mv $tmp $img # remplace l'ancienne image par la nouvelle
  chown -R www-data:www-data $pat && chmod -R 775 $pat # change les droits sur le fichier
fi
