

awk -F, -v date="12" -v reps="re" '
    BEGIN{ if(!date || !reps) exit } 
    $1 ~ date && $2 ~ reps
' simple.txt 