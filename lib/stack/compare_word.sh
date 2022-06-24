prewords=""
NL=""
while IFS= read line; do
    readarray -t -d" " arr <<<$line
    if [[ "$prewords" ==  "${arr[0]} ${arr[1]} ${arr[2]} ${arr[3]}" ]]; then
        printf "%s" "$line"
    else
        printf "$NL"
        printf "%s" "$line"
        NL="\n"
    fi 
    prewords="${arr[0]} ${arr[1]} ${arr[2]} ${arr[3]}" 
done < compare_words.txt