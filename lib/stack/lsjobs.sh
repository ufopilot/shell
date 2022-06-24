
instances=(Instance1 Instance2 Instance3)
for inst in ${instances[@]}; do
    echo "Instance: $inst"
    while IFS= read -r id state healthy user date name group
    do
       echo "${line}"
       echo -e "List of unhealthy job/s for Instance1: \n $inst" \| mailx -s "$subject $name" -r "$mail_from" email@app   
    done  < <(cat lsjobs.txt|grep -v yes|awk 'NR>2')
done