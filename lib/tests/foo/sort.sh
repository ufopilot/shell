string="AAASSSSFFRREEEAAAAFFFFFEE"
#awk 'BEGIN{ FS="|" } { a[$1]=(a[$1]?a[$1]:$1) FS $2 } END{ for (i in a){ print a[i] } }' file.txt
#grep -o . <<<$string|uniq -c|awk '{ a[$2] += $1}END{for (i in a) print i}'
grep -o . <<<$string|uniq -c|awk '
{ar[$2]+=$1}
END{ 
asort(ar,ar, "@unsorted"); 
for (i in ar) print i, ar[i]}'
