awk '
    {
        a["first,"NR]=$1;
        a["last,"NR]=$NF;
        a["row,"NR]=$0
    } 
    END{
        for (i=1; i<=NR; i++) 
            if (a["last,"i] != a["first,"i+1]) print a["row,"i]
    }
    ' lastcol 