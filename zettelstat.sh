#!/bin/zsh

#ZK
ZK="/Users/will/Dropbox/zettelkasten/"
cd $ZK

# Current Zettel
zettel="A-Dispositional Differences In Cognitive Motivation 202012230627.md"
# Word count
words=$(cat "$zettel" | wc -w)
# NOT WORKING  
# Number of tags
# tags=$(egrep -E -e ' #\w[a-z]*' "$zettel" | wc -l)
tags=$(egrep -oiEe ' #\w[a-z]*' "$zettel" | wc -l)
# Get today's date
todaysdate=$(date -j +%Y%m%d%H%M)
# Get date from file name
cdate=$(find $zettel -print | sed -E 's/^.*([0-9]{12}).*/\1/')
# Out going links
outlinks=$(egrep -oiEe '\[\[\d{12}\]\]' "$zettel" | wc -l)
# Correction for UUID
outlinks=$((outlinks -1))
# In bound (back) links
inlinks=$(egrep -E -e $cdate $ZK*.md | wc -l)
# Correction for UUID
inlinks=$((inlinks -1))
# Date zettel created
end=$(date -j -f "%Y%m%d%H%M%S" $cdate +%s)
# Todays date
now=$(date +%s)
# Ratio of link integration
ratio=$(printf "%.1f\n" "$(echo "scale=10;$inlinks / $outlinks*100" | bc)")

#  for i in $ZK"*.md"
#  grep -wls '#sturcture-note' $i > ~/Downloads/notelinks.txt
#     # number=$(grep -c "\[\[" "$f" ) 
#     for a in ~/Downloads/notelinks.txt
#     echo  "text"
#     done 
#  done   

# output
echo "Words:    " $words
echo "Tags:     " $tags
echo "Out Bound Links: " $outlinks
echo "In Bound Links:  " $inlinks
echo "Ratio of In to Out Bound Links: " $ratio"%"
echo "Today is:  " $todaysdate
echo "Cdate is : " $cdate
printf '%d days since zettel was created\n' "$(( (now-end)/86400 ))"
