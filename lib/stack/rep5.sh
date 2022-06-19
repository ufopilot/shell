# while read -r user domain; do 
#   echo "Sitemap: https://${domain}/sitemap.xml"  tee -a /home/"${user}"/public_html/robots.txt 2>/dev/null; 
# done < <(sed '/^$/d; s/^.*=//; s/ //g' INPUT_FILE|sed 'N;s/\n/ /')

while read -r user domain; do 
  echo "echo "Sitemap: https://${domain}/sitemap.xml"  | tee -a /home/"${user}"/public_html/robots.txt" 
done < <(sed -E 's/^.*=[ ]?//;/^ *$/d' INPUT_FILE|paste - -)


awk -F\| '$1~/^.*[A-z]{3}$/' alphabets.ttx 
awk -F\| '{ printf "%s", ($1 ~ /^.*[A-z][A-z][A-z]$/ ? $0"\n": "") }' alphabets.ttx 