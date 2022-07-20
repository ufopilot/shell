#!/bin/bash

declare -A result
while IFS= read -r line; 
    do result[${line%% *}]=$((${line#* }+result[${line%% *}])); 
done < <(cat File[123].txt)

for key in "${!result[@]}"; do echo "$key ${result[$key]}"; done|sort 



awk '
     {a[$1]+=$2}
     END{ 
        asorti(a,b); for(i in b) print b[i],a[b[i]]
     }
 ' File[123].txt
echo 
 awk '{a[$1]+=$2}END{asorti(a,b);for(i in b)print b[i],a[b[i]]}' File[123].txt