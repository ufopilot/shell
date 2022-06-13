#!/bin/bash
looping="a b"
systemvar="SystemA SystemB"
dc="s1"

for i in $looping; do
    for j in $systemvar; do
          line="$i some other variable"
          echo "line:             " $line
          bookmark="$dc""_bookmark_""$j"
          echo "created variable: " $bookmark
          "${!bookmark}"="$line" ### appending to s1_bookmark_systemA, then appending to s1_bookmark_systemB and so on
          echo -e "${!bookmark}"
    done
done

echo $s1_bookmark_SystemA
echo $s1_bookmark_SystemB