

#!/bin/bash
awk '
    {
        match($0, /(.*) (.*) ([0-9]{2})([0-9]{2})([0-9]{4})/, m)
        arr[NR]=m[2]m[5]m[4]m[3]" "$0
    }
    END{ 
        asorti(arr, sorted_arr, "@val_num_desc") 
        for (i in sorted_arr){
            row=arr[sorted_arr[i]]
            sub(/^[^ ]* /,"",row)
            print row
            
        } 
    }
' score

exit

sed -E 's/(.*) (.*) ([0-9]{2})([0-9]{2})([0-9]{4})/\2\5\4\3 \1 \2 \3\4\5/' raw.dat|sort -nr|cut -d" " -f2-


while IFS=" " read -r n s d; do
    echo "${s}${d:4:4}${d:2:2}${d:0:2} ${n} ${s} ${d}"
done < score|sort -nr|cut -d" " -f2-

exit
# awk '
#     {

#     }1
# ' <(
    paste \
    <(cut -d" " -f2-2 score) \
    <(cut -d" " -f3- score| cut -c5-8) \
    <(cut -d" " -f3- score| cut -c3-4) \
    <(cut -d" " -f3- score| cut -c1-2) \
    <(sed 's/^/& /' score) |sort -rn |cut -d" " -f2-
#    )


exit
awk '
    { 
        date=gensub(/([0-9]{2})([0-9]{2})([0-9]{4})/,"\\3\\2\\1",1,$3)
        #print $2date
        #source[sprintf("%d",$2date)]=$1
        source[sprintf("%3s",$2) date] = $1;
        a[date]=$2" "$1;
    }
    END{
        asort(a, asorted, "@val_num_asc") 
        for (i in a){
            print i,a[i]
            b[a[i]] = i
        }

        for (i in b){
            print i,b[i]
        
        }

        # asorti(source,dest,"@val_num_desc")
        # for (i = 1; i <=NR; i++)
        #     print dest[i] 
        # #for (i in dest) print dest[i]
    }
' score