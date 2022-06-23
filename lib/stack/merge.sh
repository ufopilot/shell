awk -F';' '
    BEGIN{OFS=";"}
    {
        a[$1][2][$2]; a[$1][3]=$3;  a[$1][4][$4]; a[$1][5]=$5;
    } 
    END{
        for (i in a){ 
            n = asorti(a[i][2], a2)
            for (x=n; x>0; x--) o2 = sprintf("%s-%s", a2[x],o2) 
            n = asorti(a[i][4], a4)
            for (x=n; x>0; x--) o4 = sprintf("%s-%s", a4[x],o4) 
            print i, substr(o2,1,length(o2)-1), a[i][3],substr(o4,1,length(o4)-1), a[i][5]
            o2=o4=""
        }
    }' merge.txt|sort