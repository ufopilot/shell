echo ${1-bla}
declare -A master_key_values=(
	[george,id]=1
	[george,mail]="cluster1-msid@somedomain.com"
	[george,city]="muenster"
	[mike,id]=2
	[mike,mail]="cluster2-msid2@somedomain.com"
	[mike,city]="dortmund"
	[john,id]=3
	[john,mail]="cluster5-msid3@somedomain.com"
	[john,city]="hannover"
)

names=($(for key in "${!master_key_values[@]}"; do echo ${key/,*/};done|sort -u))
for name in "${names[@]}"; do
    printf "User %s from %s has id %s and mail %s\n" \
           $name \
           ${master_key_values[$name,city]} \
           ${master_key_values[$name,id]} \
           ${master_key_values[$name,mail]} 
done

