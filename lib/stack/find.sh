#!/bin/bash

DIR="/opt/dev/shell/lib/stack/_spaces"

while IFS= read -r line; do 
    fullpath="$line"
    dirname=$(dirname "$line")
    basename=$(basename "$line")
    echo "$fullpath, $dirname, $basename"
    

    # your code
    # ...
done < <( 
    find "${DIR}" -mindepth 1 -maxdepth 1 -printf "%T@ %p\n"| # print files/folders with TSP 
    sort -n|  # sort timestamp (maybe sort -nr)
    awk '{sub(/[^ ]+ /,"")}1' # remove first field (TSP)
)