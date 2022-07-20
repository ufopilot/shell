#If versions are not sorted and version pattern always ??*.?*.xx

     awk -F'["/]' '
       /href="([0-9]+\.[0-9]+\.[0-9]+)\/"/ { a[NR]=$2 } 
       END{
           asorti(a,b,"@val_num_desc");
           print a[b[1]]
       }
    ' index.html

#    1.0.75
