# Print a .md file. Needs a wait while pandoc does its thing.

pandoc --pdf-engine=xelatex -i /Users/will/Documents/Tal\ -\ Philosophical\ and\ Photographic\ Ramblings.md  -o /Users/will/Downloads/Test2.pdf

while  [ ! -f  "/Users/will/Downloads/Test2.pdf" ]
do
    echo "not arrived yet" >> /Users/will/Downloads/result.txt
done

lp /Users/will/Downloads/Test2.pdf
