
awk '{ 
       if ($3 != "" && $3 in a){  
          $1=a[$3]["fst"]"-"$1; 
          $2=a[$3]["sec"]"-"$2; 
          print 
       }else{  
         a[$3]["fst"]=$1; a[$3]["sec"]=$2 
       }
}' 1.txt 2.txt
