cd /Users/will/Dropbox/zettelkasten/
egrep -Eo '([0-9]{12})' *202104230922.md  | sort | sed -E ';s/^([0-9]+)/›\[\[\1\]\]/g'|sed -e :a -e '$!N;ta'
