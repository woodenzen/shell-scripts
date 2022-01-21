# Set creation date from date in filename
# https://stackoverflow.com/questions/57693562/set-creation-date-from-date-in-filename/57694105#57694105


for i in *.md; do
   SetFile -d $(sed 's/[^0-9]//g;s/\(.\{4\}\)\(.\{2\}\)\(.\{2\}\).*/\1\/\2\/\3 00:00:00/' <<< "$i") "$i"
done
