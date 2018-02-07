#!/bin/bash

#1920x1080
convert -size 1920x1080 xc:none -fill blue -draw 'circle 960,540,1445,540' -alpha extract /tmp/xplanet/img/transparencymask.png
convert /tmp/xplanet/img/xplanet_planeteterre.png  /tmp/xplanet/img/transparencymask.png  -alpha off -compose CopyOpacity -composite   /tmp/xplanet/img/xplanet_planeteterre.png
convert /tmp/xplanet/img/xplanet_planeteterre.png -background  DeepSkyBlue  \( +clone -shadow 80x50+10+10 \) +swap -background  none   -flatten /tmp/xplanet/img/xplanet_planeteterre.png
rm /tmp/xplanet/img/transparencymask.png
