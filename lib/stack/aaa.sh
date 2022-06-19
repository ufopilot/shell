#!/bin/bash
input="db.txt"

# check third field 
echo "check third field"
while read -r _ _ rec_column3 
do
  if [[ -z "$rec_column3" ]]; then
    echo "not found" >&2;
  elif ! [[ $rec_column3 =~ ^[0-9]+$ ]] ; then
    echo "'$rec_column3' is not a number" >&2;
  elif [[ $((rec_column3 % 2)) -eq 0 ]]; then 
    echo "'$rec_column3' is even" >&2
  else 
    echo "'$rec_column3' is odd" >&2
  fi     
done < $input

echo "-----------------------"
# check last field
echo "check last field"
while IFS=' ' read -r -a array  
do
  last_column=""
  [[ ${#array[@]} -ne 0 ]] && last_column=${array[-1]}
  if [[ -z "$last_column" ]]; then
    echo "not found" >&2
  elif ! [[ $last_column =~ ^[0-9]+$ ]] ; then
    echo "'$last_column' is not a number" >&2
  elif [[ $((last_column % 2)) -eq 0 ]]; then 
    echo "'$last_column' is even" >&2
  else 
    echo "'$last_column' is odd" >&2
  fi     
done < $input
