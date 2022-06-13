#!/bin/bash

FILE="2.json"
JSON=$(jq -r . "$FILE")
# for i in $(jq -n '[inputs|.Results[]|keys[]]|sort|unique' <<<"$JSON" | jq -r '.[]'); 
# do 
#     #echo $i; 
#     jq -nc '$ARGS.positional' --args $i 2 3
#     #jq -nc '{var: $ARGS.positional}' --args ${VAR[@]}
# done
#jq -rc '.Results[] |[ .Severity, .InstalledVersion, .VulnerabilityID ]' 2.json 
jq_args=( )
    jq_query='.'
  for key in $(jq -n '[inputs|.Results[]|keys[]]|sort|unique' <<<"$JSON" | jq -r '.[]'); do
  echo $key
        #[[ ${keys[$idx]} ]] || continue # skip values with no corresponding key
        jq_args+=( --arg "$key"   "$key"   )
        #jq_args+=( --arg "value$idx" "${values[$idx]}" )
        #jq_query+=" | .[\$key${idx}]=\$value${idx}"
    done

    # run the generated command
    jq "${jq_args[@]}" "$jq_query" <<<'{}'

#jq -nc '$ARGS.positional' --args $(jq -n '[inputs|.Results[]|keys[]]|sort|unique' <<<"$JSON"| jq -r '.[]')