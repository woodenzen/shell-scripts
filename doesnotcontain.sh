# How many files in folder do not contain a string
# Usage: doesnotcontain.sh <folder> <string>
# Example: doesnotcontain.sh /home/username/Downloads/ "string"
# Author: Will Simpson and GPT-3

# check if folder exists
if [ ! -d "$1" ]; then
    echo "Folder $1 does not exist"
    exit 1
fi

# check if string is empty
if [ -z "$2" ]; then
    echo "String is empty"
    exit 1
fi

# count files
count=0
for file in "$1"/*
do
    if ! grep -q "$2" "$file"; then
        count=$((count+1))
        echo $file
    fi
done

echo "$count"
