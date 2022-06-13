
export fname="foo" lname="bar" location="baz"

SAMPLE_JSON='{
  "first_name": "",
  "last_lname": "",
  "location": "",
  "key": "value"
}'

jq '{
    "first_name":env.fname, 
    "last_lname":env.lname, 
    "location":env.location,
    "key": .key
}' <<<"$SAMPLE_JSON"

SAMPLE_JSON='{
    "param1": "value1", 
    "param2": "value2", 
    "param3": {
                "param4": "value4", 
                "param5": "value5"
              }
}'

jq '{
    "param1": env.fname, 
    "param2": env.lname, 
    "param3": {
                "param4": .param3.param4, 
                "param5": env.location
              }
}' <<<"$SAMPLE_JSON"


awk -F'[:,]' '/userAccessId/{id=$2;getline;if($2>0){gsub(/ /, "", id);print id}}' sample.json 

WORKSPACE="wahtever"
OPTS=()
OPTS+=("-Pcommon,coverage") 
OPTS+=("clean") 
OPTS+=("org.jacoco:jacoco-maven-plugin:prepare-agent") 
OPTS+=("install") 
OPTS+=("-Dmaven.test.failure.ignore=true")
OPTS+=("-Dclient.version=0.2-SNAPSHOT") 
OPTS+=("-Djacoco.outputDir=${WORKSPACE}/target")
echo mvn "${OPTS[@]}" 




#jq -n --slurpfile myArray sample.json '{"document_type":"user data", "user_records":$myArray}'

#
# {
#   "document_type": "user data",
#   "user_records": [
#     {
#       "id": 10406592,
#       "username": "sallison",
#       "email_address": "stellaallison@gmail.com",
#       "phone_number": "960-491-156",
#       "first_name": "Stella",
#       "last_name": "Allison",
#       "middle_name": "Amelia",
#       "sex": "FEMALE",
#       "birthdate": "2005-01-25",
#       "join_date": "2005-11-19T12:04:50.105-08:00",
#       "previous_logins": 9263,
#       "last_ip": "12.184.173.143"
#     },