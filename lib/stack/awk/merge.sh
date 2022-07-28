awk '
    NR==FNR{
        a[NR",min"]=$3; a[NR",max"]=$4; a[NR",last"]=$NF
        nr=NR
        next
    }
    {
        for(i=1;i<=nr;i++) {
            if(a[i",max"]-$4 >= 0 && $4-a[i",min"] >= 0){
            #if (a[i",min"] <= $4 && $4 <= a[i",max"]){
                print a[i",last"]
                next
            }
        } 
        print "NA"
    }' file2 file1