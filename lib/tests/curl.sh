#!/bin/bash
declare -a CURLPOST
CURLPOST+=("some options")
CURLPOST+=("other options")
CURLPOST+=("--form" "\"branch=default-branch\"")
CURLPOST+=("--form" "\"commit_message=[ Syncing ]\"")
declare -p CURLPOST

my_list="apple boy"
for i in ${my_list}; 
do 
    echo $i; 
    CURLPOST+=("--form" \"actions[][action]=update\")
    CURLPOST+=("--form" \"actions[][file_path]=JSON_FILES/$SYNC_ENV/${i}.json\")
    CURLPOST+=("--form" \"actions[][content]=\<${i}.json\")                         
done

CURLPOST+=("-H" "\"PRIVATE-TOKEN:$TOKEN\"" "\"https://gitlab.myorg.com/api/v4/projects/$prid/repository/commits\"")

echo curl  ${CURLPOST[@]}
