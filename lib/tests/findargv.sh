 #cat file.txt | xargs -n 2 bash -c 'echo  "$1" "$2" >> file${1:((${#1}-1)):1}.txt' argv0

 #find ./sqls -maxdepth 1 -type f -name "*.sql" -ls|nl|xargs -n 2 -bash -c 'echo "$1"- "$2" ' argv0

  #find . -maxdepth 1 -type f -name "*.sql"|nl
  #|xargs -n 2 -bash -c 'echo "$1"- "$2" ' argv0

  #find . -type f -name "*.jpg" |sort|nl| xargs -n 2 bash -c '[ "$#" -eq 2 ] && echo mv "$2" Something"$1".jpg' argv0

  # recusive
  i=1
  shopt -s globstar
  for f in ./**; 
  do
    [[ -f "$f" ]] || continue  # is not a file
    echo $((i++)), $f;
  done