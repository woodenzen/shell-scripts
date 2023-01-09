# Find the number of notes with a prepended signifier.

#!/bin/bash
cd ~/Dropbox/zettelkasten/
folder_to_count="~/Dropbox/zettelkasten/"
note_count=$(ls | egrep -E -e '^.-|^[^0-9a-zA-Z]' |  wc -l)
note_total=$(ls *.md | wc -l)
percentage=$(printf %.2f%% "$((10**3 * 100 * $note_count / $note_total))e-3")


clear
echo ★★★★★
echo $note_count notes with signifiers preprended in $folder_to_count and that represents $percentage of the $note_total Total Notes in zettelkasten.
