string='ext/:some_random_text:text_i_w4nt_to:k33p.until_th3_end_1
text/:some_random_text:text_i_w4nt_to::k33p.until_th3_end_1'

awk -vFS=: -vOFS=: '{$1=$2="";gsub(/^::/,"")}1' <<<"$string"
#awk 'BEGIN {FS=OFS=":"} {$1="";$2=""; $0=$0; sub(/:/, "", $0)}'1 <<<"$string"
