scr=$(tput cols)
#tmp=$(perl -e 'print "x"x252') # x's easier to verify visually
#printf $tmp|wc -c
#printf "x"*252

str=$(printf "%252s")
tmp=${str// /█}

#echo ${#str}
#tput cols
#tmp=$(printf '█%.0s' {1..252})

echo ${#tmp}
while ((${#tmp}))                    # while the var has length
do max=$(( scr-(scr%3) ))            # scr-(scr%3) sets to highest multiple of 3
   ((max > ${#tmp})) && max=${#tmp}  # when remaining shorter, use that
   echo "$max: ${tmp:0:$max}"        # show length and the string 
   tmp=${tmp:$max}                   # chop used part off the front
done

value=4
while read input && [[ "$input" -ne "$value" ]]; do
    echo "The input must be between 1 and 4" >&2
done

echo '+(48)123 456 768'|grep -oE '\(?\<[0-9]{3}[-) ]?[0-9]{3}[ -]?[0-9]{3}\>'