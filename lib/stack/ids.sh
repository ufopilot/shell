awk '
    NR==1{split($0,ids); next} 
    {split($0,names)}
    END{
        #for(i in ids) printf "%d(%s)\n", ids[i], names[i]
        for(i in ids) printf "%5d ==> %s\n", ids[i], names[i]
    }
' <(id -G) <(id -nG)