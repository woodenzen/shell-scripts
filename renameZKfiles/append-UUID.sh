# Description: append UUID to the end of a filename.

# find in all the files of a directory the occuance of a UUID in the form UUID   ›[[202202211005]]
ZK=/Users/will/Dropbox/Projects/shell_scripts/renameZKfiles/JAMM328
cd '/Users/will/Dropbox/Projects/shell_scripts/renameZKfiles/JAMM328'
OIFS="$IFS"
IFS=$'\n'
for filename in $ZK/*.md; do
    title=$( basename "$filename" )
    # sed -n "s/UUID.*›\[\[\(.*\)\]\]/\1/p" "$title" 
    ctime=$(sed -n "s/.* \(02.*[AM,PM]\)$/\1/p" "$title" | sed 's/-/\//g')
    mtime=$(date -r $title +'%m/%d/%Y %H:%M %p') 
    echo $title :: mtime = $mtime :: ctime = $ctime
    SetFile -d  $ctime $filename
done
IFS="$OIFS"



# Seems like quoting problems with the sed command.  I can't get it to work.  I'll try that later. The SetFile command isn't working. 

# [regex - Batch rename files regular expression on Mac - Stack Overflow](https://stackoverflow.com/questions/31521420/batch-rename-files-regular-expression-on-mac)
# find . -maxdepth 1 -name '*.pdf' | while read filename; do newfilename=`echo $filename | sed '/[0-9]/s/[^0-9]*\.pdf/.pdf/'`; echo mv $filename $newfilename; done

# With bash this can be done simplier like:

# for f in *;do
# echo "$f" "${f%.*}hallo.${f##*.}"
# done
# example:

# $ ls -all
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file1.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file2.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file3.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file4.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file5.txt 

# $ for f in *;do mv -v "$f" "${f%.*}hallo.${f##*.}";done
# 'file1.txt' -> 'file1hallo.txt'
# 'file2.txt' -> 'file2hallo.txt'
# 'file3.txt' -> 'file3hallo.txt'

# $ ls -all
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file1hallo.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file2hallo.txt
# -rw-r--r-- 1 29847 29847    0 Aug 21 14:33 file3hallo.txt
# This works because ${f%.*} returns filename without extension - deletes everything (*) from the end (backwards) up to first/shortest found dot.

# On the other hand this one ${f##*.} deletes everything from the beginning up to the longest found dot, returning only the extension.
