# creates a zettel with names and notelinks (outputZettel) from reference note of names (inputZettel)

# User settings
zettel='/Users/will/Dropbox/zettelkasten/'
inputZettel='Target Mentions in Zettelkasten 202105260558.md'
outputZettel='Mentions in Zettelkasten 202105260734.md'

IFS=$'\n'

destination=`mktemp -d -t mentions`
cd ${zettel}
touch ${zettel}${outputZettel}

for line in `cat ${zettel}${inputZettel}`
  do
   number=$(grep --exclude={"${inputZettel}","${outputZettel}"} -iF ${line} *.md |wc -l)
   echo \#\# ${line} ${number} Mentions
   grep --exclude={"${inputZettel}","${outputZettel}"} -iFl ${line} *.md | sed -E 's/(.*)([[:digit:]]{12})(\.md)/\[\[\2\]\] \1/'
   echo  " "
 done > ${destination}${outputZettel}

sleep 1
mv ${destination}${outputZettel} ${zettel}${outputZettel}
