

grep -o, --only-matching
    Print only the matched (non-empty) parts of a matching line, 
    with each such part on a separate output line.
    Using . as pattern for every character 
   
uniq -c, --count
    prefix lines by the number of occurrences

awk '{printf "%s%d", $2,$1}'
    Reorder the output. Character '$2' first then number '$1'. 
    Print all in a single line