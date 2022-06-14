awk -F',' ' {r=sprintf("%s%s",r,$0)} $(NF-1)","$NF == "Y,H" {print r; r=""}' input_file3

# cat file.txt | xargs -n 2 bash -c 'echo  "$1" "$2" >> file${1:((${#1}-1)):1}.txt' argv0