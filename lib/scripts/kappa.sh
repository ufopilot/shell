awk '
    BEGIN{
        print "ID","lnL","kappa","tree-length"
    }
    /lnL/{out2=$(NF-1); next}
    /kappa/{out3=$NF; next}
    /tree/{out4=$NF; print out1,out2,out3,out4; next}
    /\\n/{next}
    {out1=$1}
' ../stack/kappa|column -t

awk '
    BEGIN{
        print "ID","lnL","kappa","tree-length"
    }
    {
        out=$1; getline
        out=out " "$(NF-1); getline
        out=out " "$NF; getline
        out=out " "$NF; getline
        print out
        next
    }
' ../stack/kappa|column -t

awk '
    BEGIN{
        print "ID","lnL","kappa","tree-length"
    }
    {
        for(i=1; i<=4;i++){
            i==1 ? out=$1 : out=out
            i==2 ? out=out" "$(NF-1) : out=out
            i==3 || i==4 ? out=out" "$NF : out=out
            getline
        }
        print out
        next
    }
' ../stack/kappa|column -t