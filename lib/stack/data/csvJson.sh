 jq -r '["name","PhoneNumber"],(.result[]|[.name,.PhoneNumber])|join(", ")' result.json
