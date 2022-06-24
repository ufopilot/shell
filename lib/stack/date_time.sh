#GNU awk
awk -F, '
    function formatDate(dt){
        Y=substr(dt,1,4); m=substr(dt,5,2); d=substr(dt,7,2)
        H=substr(dt,9,2); M=substr(dt,12,2); S=substr(dt,15,3)
        return Y" "m" "d" "H" "M" "S
    }
    NR==1{ print }
    NR>1{ a[$3][NR]["time"]=$1$2; a[$3][NR]["row"]=$0;}
    END{
        for(firm in a){                                             
            if (length(a[firm]) > 3){                               
                firstrow=1
                for (n in a[firm]){                                 
                    if (firstrow != "") time = a[firm][n]["time"]                     
                    diff = (mktime(formatDate(a[firm][n]["time"])) - mktime(formatDate(time)))  
                    if (diff >= 0 && diff < 30 ) print a[firm][n]["row"]                
                    firstrow=""                                                                                
                }
            }
        }
}' date_time.txt