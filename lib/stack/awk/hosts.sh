 awk '
    ! tmp { tmp=$1 } 
    length(tmp)<=256 { out=tmp; tmp=tmp" "$2} 
    length(tmp)>256  { print out; tmp=$0 }
    END{print tmp}
' hosts 

awk '
    !len{
        len=length($1)+1; c1=$1
    }
    {
        a[NR]=a[NR-1]+length($2)+1
    }
    END{
        for(i in a) print a[i]
    }
' hosts