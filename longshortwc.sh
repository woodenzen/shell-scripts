#!/bin/bash

# home directory
cd '/Users/will/Dropbox/zettelkasten'

wc -w *.md | sort > temp.out
echo Least Number of Words && echo ----- 
head -20 temp.out 
echo Most Number of Words && echo ----- 
tail -22 temp.out
echo Total Number of Words && echo ----- 
tail -1 temp.out


