#!/bin/bash
FILE="test.json"
JSON="$(sed -E 's/([}{])/\n\1\n/g' $FILE)"
while :; do
    JQTEST=$(jq  '.' <<<"$JSON" 2>&1|grep "Objects must consist of key:value pairs at line")
    rc=$?
    if [ $rc -eq 0 ]; then 
        LINE=$(sed -E "s/.* line ([0-9]+), .*/\1/" <<<"$JQTEST")
        COL=$(sed -E "s/.* column ([0-9]+)$/\1/" <<<"$JQTEST")
        [ "$COL" -ne 1 ] && LINE=$((LINE-1)) 
        JSON=$(sed -E "$LINE s/\{/[/; $LINE s/}/]/" <<<"$JSON")
    else
      jq  '.' <<<"$JSON" # > "new_${FILE}" or "${FILE}" 
      break
    fi
done