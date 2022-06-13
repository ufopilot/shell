#!/bin/bash

changeStrValue(){ JSON=$(jq ".$1 = \"$2\"" <<<"$JSON"); }
changeIntValue(){ JSON=$(jq ".$1 = $2" <<<"$JSON"); }
changeBoolValue(){ JSON=$(jq ".$1 = $2" <<<"$JSON"); }

INPUT_FILE="terra.json"
OUTPUT_FILE="terra.json"
JSON=$(jq -r . "$INPUT_FILE")

# change values (String)
changeStrValue aad_login_name foo
changeStrValue aad_login_object_id bar
changeStrValue aad_login_sp_password baz
#change values (Integer)
changeIntValue aad_login_tenant_id 123
#change ge values (Bool)
changeBoolValue enable_syn_sqlpool true
changeBoolValue enable_syn_sparkpool false
# save changes to OUTPUT_FILE or INPUT_FILE
jq . <<<"$JSON" > "$OUTPUT_FILE"

