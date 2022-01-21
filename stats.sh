#!/bin/bash

# home directory
cd ~/Dropbox/zettelkasten

# variables
todaysdate=$(date -j +%Y%m%d)
yesterday=$(date -jf '%Y%m%d' -v-1d "$todaysdate" +%Y%m%d)
totalzettel=$(ls | wc -l)
totalwords=$(find . -maxdepth 1 -type f \( -name "*.md" \) -exec wc -w {} + | grep total | cut -f1 -dt)
totallinks=$(egrep -E -e '\[\[\d{12}\]\]' *.md |wc -l)
pastrecord=$(tail -1 ~/Dropbox/zettelkasten/media/stats.csv)
read var1 var2 var3 var4 var5 var6 var7 <<< $pastrecord

# math
tzincr=$((totalzettel-var2))
twincr=$((totalwords-var3))
tlincr=$((totallinks-var4))

#print
echo $yesterday $totalzettel $totalwords $totallinks $tzincr $twincr $tlincr  >> ~/Dropbox/zettelkasten/media/stats.csv
