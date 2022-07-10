awk -v t1="2022-01-01-10:01" -v t2="2022-01-03-13:05" -v st="AAA-passed" '
    $1 >= t1 && $2 == st {cnt++;} 
    $1 >= t2 {exit}
    END{print cnt}
' dates2.txt 
