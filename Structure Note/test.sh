#!/bin/zsh
 
while read line
do
    # echo "$line"

    num=$(echo $line | wc -w) # 
    UUID=$(echo $line | sed -n -E 's/.*([[:digit:]]{12})\]\]/\1/p')
    name=$(find /Users/will/Dropbox/zettelkasten/*$UUID.md -type f -execdir printf "%s\n" {} +)
    echo "$UUID" ${name% *}  
 done < 'test.csv' > test.md



#  user@host:~$ while read url; do
#    # download the page
#    content=$(curl -Ls $url)
#    # count the words
#    num_of_words=$(echo $content | wc -w)
#    # extract the title
#    title=$(echo $content | grep -oP '(?<=<title>)[^<]+')
#    # send an email with the page's title and word count
#    echo "$content" | mail whoever@stanford.edu -s "$title: $num_of_words words"
#    echo "...Sending: $title: $num_of_words words"
# done < urls.txt