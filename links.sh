#!/bin/zsh

cd ~/Dropbox/zettelkasten


# egrep -Eoc '([0-9]{12})' *202002141244.md > ~/Downloads/notelinks.txt
 for i in "*.md"

  grep -wls '#book' $i > ~/Downloads/notelinks.txt
    # number=$(grep -c "\[\[" "$f" ) 
    for a in ~/Downloads/notelinks.txt
 echo  "text"
done  #> ~/Downloads/notelinks.txt


# for i in `find . -type f -regex \.\\/[A-Za-z0-9]*`
# do
# WHAT U WANT DONE
# done

