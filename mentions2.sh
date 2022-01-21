#!/bin/sh
# creates a zettel with names and note links (output) from reference note of names (input)

# User settings -
zettel='/Users/will/Dropbox/zettelkasten/'
input='Target Mentions in Zettelkasten 202105260558.md'
output='Mentions in Zettelkasten 202105260734.md'

# algorithm:
cd $zettel
TMP=tmp$$
# trap "rm $TMP" EXIT    # remove the temp file on exit; comment out line if you want to see $TMP


IFS=$'\n'

# capture all mentions of all the names from $input
egrep --exclude={"$input","$output"} -iF - $input *.md > $TMP

# $TMP has it all so now we separate out counts for each name
for name in $(cat $input); do
   count=$(grep -iF "$name" $TMP | wc -l)
   echo "## $name $count Mentions"
   grep -iF   "$name" $TMP | \
   sed -E 's,(.*)([[:digit:]]{12})(\.md):.*,\[\[\2\]\] \1,'  | uniq
   echo  " "
done > $output
