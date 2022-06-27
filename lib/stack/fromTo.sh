awk -v m1="start" -v m2="end" -v s="item#3" -v o="none" '
   $1==m1 {found=1; i=NR; a[i]=o; next}
   $1==m2 {found=0;}
   found  { $0 ~ s ? a[i]=s : ""}
   END{
      for(i in a) print a[i]
   }
' out