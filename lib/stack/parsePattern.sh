awk '
    /connection from/{ nr=NR; conn[nr]=$NF; auth_counter[nr]=0; next; }
    { auth_counter[nr]++; auth_msg[nr]=$NF; }
    END{
        for(i in auth_counter) if(auth_counter[i]==1) print conn[i], auth_msg[i]  
    }' ffile.txt 