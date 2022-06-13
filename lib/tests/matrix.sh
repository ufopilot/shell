awk -F, '
    {
        (NF==4 ? s=1 : s =3); 
        
        while(i=1; i<=NF; i++){
                print $(i), s
        }
    }' matrix.txt 