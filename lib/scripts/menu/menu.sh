#!/bin/bash

config_file=./config.json
CONFIG=$(jq -r '.' "${config_file}")

header_len=$(jq -r '.header|length' <<<"${CONFIG}")

for ((i=0; i<$header_len; i++)); do
    title=$(jq -r '.header['$i'].title' <<<"${CONFIG}")
    width=$(jq -r '.header['$i'].width' <<<"${CONFIG}") 
    printf "%-${width}s " "$title"
done


echo

