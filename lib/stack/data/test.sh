awk -F'~| where | group ' '$0=$1"~"$2"~"$4"~"$NF' file 
echo
awk -F'~| where | group ' -v OFS='~' '{print $1,$2,$4,$NF}' file
echo
awk -F '~' -v OFS='~' 'gsub(/.* where | group by.*/,"",$3)' file
echo
awk '$0=gensub(/(.*)select .* where (.*) group by(.*)/,"\\1\\2\\3",1)' file
echo
awk 'match($0,/(.*)select.*where (.*) group by(.*)/,a){$0=a[1]a[2]a[3]}1' file 
    
