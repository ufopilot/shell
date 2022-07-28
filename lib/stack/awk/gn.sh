
  awk -F"|"  -v OFS=',' '
    / GN= /{ print  $2,$10,$3" "$4; next }
    { print  $2,$3,$3" "$4; next}
  ' <(sed -E 's/ /|/; s/( [^ ]*)=([^ ]*)/|\1= |\2/g' gn.txt)

# awk '
#     BEGIN{FS="|"; OFS=","}
#     match($3,/(.*) OS=.* GN=([^ ]*) .*/,a) {
#         print $2,a[2],a[1] 
#         next
#     }
#     match($3,/^([^ ]*) (.*) OS=.*/,a){
#         print $2,a[1],a[1]" "a[2]
#     }
# ' gn.txt
# awk -F'\\||OS=|OX=|GN=|PE=|SV=' '
#     BEGIN{OFS=","}
#     /GN=/ {
#         sub(/ $/,"",$6)
#         print $2,$6,$3
#         next
#     }
#     {
#         print $2,gensub(/ .*/,"",1,$3),$3
#     }
# ' gn.txt

# awk '
#     BEGIN{FS="|"; OFS=","}
#     /GN=/ { gn=gensub(/.* GN=([^ ]*) .*/,"\\1",1)}
#     !/GN=/ { gn=gensub(/ .*/,"",1,$3) }
#     { sub(/ OS=.*$/,"",$3); 
#     print $2,gn,$3 }
# ' gn.txt 


_='z
I1WXP1,mcrA,I1WXP1_9EURY Methyl coenzyme M reductase subunit A (Fragment)
A0A059VAR9,atpB, A0A059VAR9_9EURY V-type ATP synthase beta chain (Fragment)
Q51760,Q51760_9EURY,Q51760_9EURY Glutaredoxin-like protein


>tr|I1WXP1|I1WXP1_9EURY Methyl coenzyme M reductase subunit A (Fragment) OS=uncultured euryarchaeote OX=114243 GN=mcrA PE=4 SV=1
>tr|A0A059VAR9|A0A059VAR9_9EURY V-type ATP synthase beta chain (Fragment) OS=Halorubrum sp. Ga66 OX=1480727 GN=atpB PE=3 SV=1
>tr|Q51760|Q51760_9EURY Glutaredoxin-like protein OS=Pyrococcus furiosus OX=2261 PE=1 SV=1
'