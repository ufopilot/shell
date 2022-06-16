#!/bin/bash

xargs -i sh -c 'grep -oq "{}" comp2.txt && echo true || echo false' < comp1.txt

for i in $(<comp1.txt); do grep -oq $i comp2.txt && echo true || echo false; done

find_in_array() {
  local string=$1
  shift
  for element in "$@"; do [[ "$element" == "$string" ]] && return 0; done
  return 1
}

readarray -t arr1 <comp1.txt
readarray -t arr2 <comp2.txt

for str in ${arr1[@]}; do
    find_in_array "$str" "${arr2[@]}" && echo true || echo false
done