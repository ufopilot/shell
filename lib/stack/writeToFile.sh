awk '
    BEGIN{
        FS=OFS="|"
        out="File3.txt"
    } 
    NR==FNR {
        a[$1]
        next
    } 
    ($1 in a){
        print $1,$2 > out
    }
    END{
        close(out)
    }' File1.txt File2.txt