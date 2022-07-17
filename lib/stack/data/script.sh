#!/bin/bash


awk '
    NR==FNR{
        FS="[\\\\,]"
        print $3","$4
        a[$3,$4]=$0
        #a[NR,1]=$1
        #a[NR,0]=$0
    }

    NR!=FNR{
        FS=" "
        c1=$1
        sub(/^[^ ]* /,"")
        c2=$0
        print c1","c2
        if(c1","c2 in a == 0) print a[c1,c2]
    }
    

' BigFile.txt inputfile.txt
