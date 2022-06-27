awk -F'a{3}' '
    {
        c=NF-1; 
        for(i=1; i<=NF; i++){
            $i~/^a/ ? ($i~/^aa/ ? c+=2 : c++) : c=c
        } 
        print $2
        print NR,c
}' out2
echo "-------"
awk '{
    print gsub(/aaa/,"")
  
    }
' out2