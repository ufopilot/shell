#!/bin/bash

args=("${@}")

mainpath=./languages/analytics
readarray -t datafolders < <(find "$mainpath" -maxdepth 1 -mindepth 1 -type d -print0|xargs -0 -I {} basename {})

for subfolder in "${args[@]}"; do
  for i in "${!datafolders[@]}"; do
    if [[ ${datafolders[i]} = "$subfolder" ]]; then
      unset 'datafolders[i]'
    fi
  done
done

datafolders=( "${datafolders[@]/#/$mainpath/}" )

#declare -p datafolders
find "${datafolders[@]}" -type f -print0 | xargs -0 rm -f