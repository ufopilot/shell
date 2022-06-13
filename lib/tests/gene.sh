#genes

FILE="c_elegans.PRJNA13758.WS283.functional_descriptions.txt"
awk '
    BEGIN{OFS=FS}
    /^WBGene/{gene=$1}
    /Concise description:/    { cflag=1; pfx="" }
    /Automated description/   { cflag=0; print "" }
    cflag                     { cdesc=sprintf("%s%s", pfx, $0); pfx=" " }
    
    /Automated description:/  { aflag=1; pfx="" }
    /Gene class description:/ { aflag=0; print "" }
    aflag                     { adesc=sprintf("%s | %s%s",cdesc, pfx,$0); pfx=" " }
    /Gene class description:/ { classdesc=$0; printf "%s|%s|%s|%s", gene, classdesc, cdesc, adesc}
' "$FILE" 
#grep "WBGene" c_elegans.PRJNA13758.WS283.functional_descriptions.txt

# > WB283_WBgenes.txt

exit
#gene class description:
awk '/Gene class description:/' c_elegans.PRJNA13758.WS283.functional_descriptions.txt > WB283_geneclass.txt

#concise description
awk '
/Concise description:/  { flag=1; pfx="" }
/Automated description/ { flag=0; print "" }
flag                    { printf "%s%s",pfx,$0; pfx=" " }   # assuming appended lines are separated by a single space
' c_elegans.PRJNA13758.WS283.functional_descriptions.txt > WB283_concise.txt

#automated description
awk '
/Automated description:/  { flag=1; pfx="" }
/Gene class description:/ { flag=0; print "" }
flag                    { printf "%s%s",pfx,$0; pfx=" " }   # assuming appended lines are separated by a single space
' c_elegans.PRJNA13758.WS283.functional_descriptions.txt > WB283_automated.txt

