#!/bin/zsh

cd /Users/will/Dropbox/zettelkasten/

# Reset the orphans zettel list.

rm '/Users/will/Dropbox/zettelkasten/Orphan-Naked Ideas 202208222105.md'

for filename in *.md; do

# For each note, various positions of a link (not the UUID "›[["),  piping the output to orphan zettel list reformating filename into The Archive link. 

    egrep -L -e ' \[\[|§\[\[|^\[\[|\.\[\[' $filename | while read i; do echo $i | sed -E 's/(.*) ([[:digit:]]{12})(\.md)/[[\1 \2]]/' >> "Orphan-Naked Ideas 202208222105.md" ; done
    done

# "shuf" is a unix random tool '3' is the number of lines returned.

#while reading random (shuf) file names, reformat for Bear.

cat "Orphan-Naked Ideas 202208222105.md" | shuf -n 3 | while read i; do echo $i | sed -E 's/\[\[(.*) ([[:digit:]]{12})\]\]/- [\1](thearchive:\/\/match\/\1 \2)/' ; done
