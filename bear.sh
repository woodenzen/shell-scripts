#!/bin/zsh

egrep -E -rnwo "::( .*?|.*?)::" boy.md |\
    sed "s/^.*:::/> /" >highlights.md |\
    sed "s/::$/\\n/" >highlights.md