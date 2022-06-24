while read -r i; 
do 
    cp script.sh "script_$i.sh" && sed -i "s/001$/$i/" "script_$i.sh"
    
done < <(printf '%s\n' {001..100})