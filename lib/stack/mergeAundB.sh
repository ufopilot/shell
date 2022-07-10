awk '
    NR==FNR{a[$0]; next}
    {b[$0]}
    END{
        for(i in a)  if (i in b == 0) print i
        for(i in b)  if (i in a == 0) print i
    }' aa.txt bb.txt 