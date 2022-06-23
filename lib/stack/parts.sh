awk -F= '
    $2!="" {
        n=$1"="; 
        for(i=1;i<length($2);i+=3){
            n=sprintf("%s%sh ",n,substr($2,i,3))
        } 
        $0=n
}1' parts.txt