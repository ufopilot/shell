#!/bin/bash


awk -F' :|, |: ' -v OFS="," '
    NR==1{ 
        print $1,$3,$5,$7,"Up since"
    }
    {
        print $2,$4,$6,gensub(/([0-1])\. ?Up since ?(.*)/, "\\1,\\2", 1, $8)
    }' output
exit

#  awk -F' :|, |: ' '
#      function formatRow(r){
#         return gensub(/([0-1])\. ?(Up since)/, "\\1, \\2:", 1, r)
#      }
#      NR==1{
#          $0 = formatRow($0) 
#          for(i=1;i<=NF-1;i+=2) printf (i==NF-1 ? "%s\n" : "%s,"), $i 
#      }
#      {
#          $0 = formatRow($0)
#          for(i=2;i<=NF;i+=2) printf (i==NF ? "%s\n" : "%s,"), $i
# }' output

# exit
while IFS=" " read -r line; do
    readarray -t -d "," lineArray<<<"$line"
    row=""
    for ((i=0; i<((${#lineArray[@]}-1)); i++)) do
        readarray -t -d":" rowArray <<<"${lineArray[$i]}"
        row+="${rowArray[1]},"
    done
    echo $row
done < output

# exit 
# awk -F, '
#     NR==1{
#         for(i=1;i<=NF;i++){
#             r=r gensub(/:.*/, ",", 1, $i);
#         }  
#         gsub(/, /,",",r); gsub(/,$/,"",r);
#         print r
#     }
#     {   for(i=1;i<=NF;i++) sub(/^.*: /,",",$i); 
#         gsub(/^,/,""); gsub(/ ,/,",");
# }1' output


# regex="^([^:]*): ?([^,]*), ?([^:]*): ?([^,]*), ?([^:]*): ?([^,]*), ?([^:]*): ?(.*)$"
# sed -E "s/$regex/\1,\3,\5,\7/" output |sed -n '1p'
# sed -E "s/$regex/\2,\4,\6,\8/" output
# #exit

# echo "---"
# awk '
#     BEGIN{re = "^([^:]*): ?([^,]*), ?([^:]*): ?([^,]*), ?([^:]*): ?([^,]*), ?([^:]*): ?(.*) ?(Up since) ?(.*)$"}
#     NR==1{
#         print gensub(re, "\\1,\\3,\\5,\\7,\\9", 1)
#     }
#     {
#        print gensub(re, "\\2,\\4,\\6,\\8", 1) 
#     }
# '  output
