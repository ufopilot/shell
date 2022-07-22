#  awk -F'[, \t]' '
#     BEGIN{ OFS="\t" }
#     FNR==NR{ a[$1]; next }
#     FNR>1 && !( $1 in a){print $1,"IN","A",$2 }
# ' spicedirect machines.csv

awk -F'[, \t]' '
     BEGIN{ OFS="\t" }
     FNR==NR && NR>1 { a[$1] = $2; next }
     FNR!=NR { b[$1] = $0 }
     ENDFILE{ 
        for (i in b) print b[i]
        for (i in a) if (i in b == 0) print i,"IN","A",a[i]   
     }
' machines.csv spicedirect