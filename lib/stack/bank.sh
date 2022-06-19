#!/bin/bash
input="bank.txt"
while read -r line  
do
  IFS='|' read -r -a array <<<"$line"
  [[ ${array[0]:0:2} == ${array[1]:4:2} ]] && echo $line  
done < $input
                 