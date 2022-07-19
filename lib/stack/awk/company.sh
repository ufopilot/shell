awk '
    {NF>1 ? a[NR]=$0 : (a[NR-1] ? a[NR-1]=a[NR-1] FS $1: a[NR]=$0)}
    END{for(i in a) printf "%s", (a[i] ? a[i]"\n" : "")}
' company
