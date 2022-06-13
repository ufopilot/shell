#!/bin/bash

getVar(){ 
    if [ "$1" -eq 0 ]; then  
        awk -F'#\\$' '{for(i=1; i<=NF; i++) print $(i)}' file.txt;
    else
        awk -F'#\\$' -v col="$1" '{printf $(col)}' file.txt;
    fi
} 
# assign variables
VAR1=$(getVar 1)
VAR2=$(getVar 2)
VAR3=$(getVar 3)
# using variables
echo "VAR1 ===${VAR1}==="
echo "VAR2 ===${VAR2}==="
echo "VAR3 ===${VAR3}==="
echo

# declare array
readarray -t my_array < <(getVar 0)
# dump
declare -p my_array|sed 's/declare -a //'
# using variables
echo "VAR1 ===${my_array[0]}==="
echo "VAR2 ===${my_array[1]}==="
echo "VAR3 ===${my_array[2]}==="

