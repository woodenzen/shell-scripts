# Notes for script
`sed 's/-/ /g'` removes "-"
  Trouble here because some files don't have a "-"
`awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'` Uppercase for each word
`for filename in temp/*.txt;` is the directory of the files.
Look for syntax for declaring a variable in shell script
Function help define what is going on.
`if ! [[ "$title" =~ ^20*.* ]]; then` is a negative call to get everything that is not