#!/bin/bash

# home directory
cd ~/Dropbox/zettelkasten

# variables
i=20210613 
until [ $i -gt 20210719 ]
 do
   totalwords=$(find . -name '*'$i'*.md' -type f -exec cat {} + | wc -w)
  
#print
if [ $totalwords != 0 ]
  then
  	totallinks=$(egrep -E -e '\[\[\d{12}\]\]' *$i*.md | wc -l)
    totalzettel=$(ls *$i*.md | wc -l)
    echo $i $totalwords $totallinks $totalzettel 
  fi
  	
 #increment date 	
  ((i=i+1))
 done | awk '{print $1 " " (totalzl += $4)" " (totalwd += $2)" " (totallk += $3)" " $4 " " $2 " " $3}'




# Using argument expansion to capture all files provided as arguments.

for FILE in ${@}
do
  if [[ ! -f $FILE ]]
  then
    echo "The file ${FILE} does not exist!"
  fi
done