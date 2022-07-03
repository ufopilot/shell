awk '
   BEGIN{ out1="Output1"; out2="Output2";}
   NR==FNR{ 
      a[$1]=$2; 
      next 
   }{ 
    NF--;
   }  
   FNR==1{ 
      #print > out1; 
      print > out2; 
      next 
   } 
   !($1 in a){ 
      # print > out1
   } 
   ($1 in a){ 
      $1=a[$1]; 
      print > "Output2"; 
      #print > "Output1"
  }
  END{
    close(out1); close(out2)
}' File1 File2
