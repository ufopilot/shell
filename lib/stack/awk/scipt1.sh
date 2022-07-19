awk -F, '
         # case 1
         $1=="a" || $1=="c" {
           print "case 1 - id:",$1; for(i=2;i<=NF;i++) print $i
         }
         # case 1
         $1=="b" {
           print "case 2 - id:",$1; for(i=2;i<=NF;i++) print $i
         }
         # case 3
         $1=="d" {
           print "case 3 - id:",$1; for(i=2;i<=NF;i++) print $i
         }
    ' data 
