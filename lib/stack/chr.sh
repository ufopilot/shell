


 awk '
    {out=$0}/^s /{(NR%2)?s="species1.":s="species2.c";sub($2,s$2,out)}{print out}
' chr

exit
 awk '
    {
        r=$0
        sub("Chr1","species1.", r)
        print r

        a[NR]=$0    
    } 
    END{
        for(i=1; i<=NR; i++){
            split(a[i], b)
            if (b[1]=="s"){
              (i%2) ? sub(b[2],"species1."b[2], a[i]) : sub(b[2],"species2."b[2], a[i]);   
            }
            print a[i]
        }
    }
 ' chr 

exit
awk -v OFS="\t" '/^s /{(NR%2) ? $2="species1."$2 : $2="species2."$2 }1' chr
awk -v OFS="\t" '/^s /{(NR%2) ? st="species1." : st="species2."; sub(/.*/,st $2, $2)}1' chr 
