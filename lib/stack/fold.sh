w=80
while IFS=" " read -r line 
do
    [[ -z "$header" ]] && { header="Y"; echo "$line"; ((i++)); continue; }
    fold -s -w "${w}" <<<" $line"|sed '2,$s/^/           /g'
done < prety.txt