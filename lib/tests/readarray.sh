#readarray -d "\n" arr < csvfile

c=1
while read row
do
    echo "row $c:  $row"
    IFS='; ' read -r -a cols_arr <<< "$row"
    #declare -p cols_arr
    for((i=0; i<${#cols_arr[@]}; i++))
    do
        echo "row $c: --- column $(($i+1)): variable is \${cols_arr[$i]} has value ${cols_arr[$i]}"
    done
    c=$((c+1))
done < csvfile
