#!/usr/bin/env zsh
#Modify at your own risk.

askforZK()
{
  echo "Here be dragons."
  echo "You are about to insert the file name into each of your notes."
  echo -n "Continue? y or n: "
  read REPLY

  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    echo "OKAY - You asked for it..."
    echo "Control C to abort!"
    echo -n "What is the path to your zettelkasten? "
    read ZK
  elif [[ $REPLY =~ ^[Nn]$ ]]
  then
    echo -n "OKAY - We'll stop..."
    exit
  else
   echo "You didn't answer 'y' or 'n' so we're aborting."
  fi

  

  if [[ $ZK =~ ^.*$ ]]
  then
    echo $ZK
  fi
}

clear
askforZK


removedashes()
{
    sed -E 's/-| / /g'
    return
}

capitalize()
{
    awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'
    return
}

# For testing 
# ZK="/Users/will/Dropbox/Git/insert-UUID"
# Zettelkasten

mkdir -p $ZK/tmp $ZK/modified $ZK/backup 
# make directories


for filename in $ZK/*.txt; do
# For each note
    title=$( basename "$filename" .txt )
    # Grab title from the filename
    if ! [[ "$title" =~ ^[0-9]{12}.* ]]; then
    # For filenames that don't led with a UUID
        cp $filename "/$ZK/backup/$title.txt"
        #  make a backup in the bak directory
        # plain=`echo $title | removedashes | capitalize`
        #  remove dashes and capitalize if needed
        awk 'BEGIN{ print "\n" }1' $filename > "$ZK/tmp/$title.tmp"
        # add a blank line on the first line to except title
        sed '1a\
Title: '$title'

        ' < "$ZK/tmp/$title.tmp" | sed '1d'> "/$ZK/modified/$title.txt"
        # place title and remove extra line
rm "$ZK/tmp/$title.tmp"
# rm tmp file, no longer needed
    else;
    # for filenames with a UUID
        cp $filename "$ZK/backup/$title.txt"
        #  make a backup in the bak directory
        utitle=`echo "${title:13:100}" | removedashes | capitalize`
        #  remove dashes and capitalize if needed
        awk 'NR==4{print; print "title: '$utitle'"} NR!=4' $filename > "$ZK/modified/$title.txt"
        # add a blank line on the first line to except title
#         sed '1a\
# Title: '$title'

#         ' < "$ZK/tmp/$title.tmp" | sed '1d' > "$ZK/modified/$title.txt" 
        # place title and remove extra line
# rm "$ZK/tmp/$title.tmp"
# rm tmp file, no longer needed
    fi    
done