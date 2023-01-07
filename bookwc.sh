#!/bin/bash

# home directory
cd ~/Dropbox/zettelkasten

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
 
for lines in $(ls -Sv 'B-The Lost Art'*.md):
  do
    echo $lines
    cat $lines | wc -w 
  done  
  
IFS=$SAVEIFS




