

awk -v n="$1" '
    BEGIN{
        mid=(n+1)/2
        for (i=1; i<=n; i++){
            for (j=1; j<=n; j++){
              if(j==mid) { c=1 } else { c="."}
              printf "%s ", c
            }
            printf "\n"    
        }
    }
'