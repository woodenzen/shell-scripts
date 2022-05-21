#!/bin/zsh

# Find the incoming and outgoing links in a group of zettel 
# in this case Book. This deturmines the most and least connected book.
OIFS="$IFS"
IFS=$'\n'

cd ~/Dropbox/zettelkasten

FILE=~/Downloads/notelinks.txt
if [[ -f "$FILE" ]]; then
    rm $FILE
fi

group="@mcpherson"

for i in $(grep -wlsi $group *.md)
do
  ((count++))
  outbound=$(egrep -E -e '\d{12}' $i | wc -l) 
  uuid=$(echo $i | sed 's/.*\(.\{12\}\)\.md/\1/')
  inbound=$(egrep $uuid *.md | wc -l) 
  sum=$(($outbound + $inbound))
  echo $i ' '$sum ': '$outbound ' '$inbound ' ' >> ~/Downloads/notelinks.txt 
done  

awk -F" {2,}" '{printf $1 " - Total Links: " $2" (In "$4" - Out "$3")\n"}' ~/Downloads/notelinks.txt | sort -t: -nrk 2,2 
echo "----------"
echo $count "Zettel in Group" $group
#  - '$count' used to correct for UUID as a link.
awk -F" {2,}" '{SUM2+=$2}{SUM3+=$3}{SUM4+=$4}END{printf "Group Total Links: " SUM2 - '$count' " (In "SUM4" - Out "SUM3 - '$count'")"}' ~/Downloads/notelinks.txt
IFS="$OIFS"
