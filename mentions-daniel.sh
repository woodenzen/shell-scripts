#!/bin/sh
# creates a zettel with names and note links (output) from reference note of names (input)

# User settings 
zettel='/Users/will/Dropbox/Projects/testzks/daniel/'
inputZettel='20220121130124_SEARCH_IN.md'
outputZettel='20220121130157_SEARCH_OUT.md'

IFS=$'\n'

# destination=mktemp -d -t mentions
cd ${zettel}
touch ${zettel}${outputZettel}

for line in $(cat ${zettel}${inputZettel})
do
# Count the number of hits
number=$(grep --exclude={"${inputZettel}","${outputZettel}"} ${line} ./*.txt | wc -l)
# Write to output file.
echo ${line} ${number} "Mentions"
grep -iF ${line} --exclude={"${inputZettel}","${outputZettel}"} ./*.txt | \
# Pretty up the output
sed -E 's/.*\/[A-Z]?([0-9]*)_(.*)\..*:(.*)/[[\1]] \2/'  | uniq
echo " "
# Send script output to output file.
done > ${destination}${outputZettel}

sleep 1
# Move temp file into position for viewing in ZK
mv ${destination}${outputZettel} ${zettel}${outputZettel}
