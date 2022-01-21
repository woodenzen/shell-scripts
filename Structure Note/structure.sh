#!/bin/zsh

OIFS="$IFS"
IFS=$'\n'
TMP=tmp$$
TMP1=tmp1$$
trap "rm $TMP" EXIT 
trap "rm $TMP1" EXIT 

cd ~/Dropbox/zettelkasten

for x in `grep -l '#zen' *.md`
do
   # printf "$x \n"  >> $TMP
   # grep -Eoc '\d{12}' $x  >> $TMP
   grep -Eo '\d{12}' $x  >> $TMP
   # UUID=$(echo $x | sed -n -E 's/.*([[:digit:]]{12})\]\]/\1/p') 
   # echo $UUID >> $TMP
done

cat $TMP |sort | uniq -c |sort -rn |  sed -E 's/([[:digit:]]{12})/\[\[&\]\]/' > $TMP1


while read line
do 
    UUID=$(echo $line | sed -n -E 's/.*([[:digit:]]{12})\]\]/\1/p')
    name=$(find /Users/will/Dropbox/zettelkasten/*$UUID.md -type f -execdir printf "%s\n" {} +)
    echo $line ${name% *}  
 done < $TMP1 | grep -vE '^.*1 \[\[|[UGBA]-' > 'Idea Collision v2 202108162203.md'

IFS="$OIFS"