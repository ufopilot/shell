#!/bin/bash

while read -r line; do
    readarray -t -d"," arr <<<"$line" 
    declare -p arr
    for ((i=1; i<${#arr[@]};i++)) do
    	echo "${arr[0]},${arr[$i]} 1"
    done
done < <(sed '/^$/d' names.txt) 