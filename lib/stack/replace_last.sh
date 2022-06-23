#!/bin/bash
mapping="  10 Minimal acces, 20 Guest, 30 View, 40 Reporter, 50 Owner,  "
awk -v map="$mapping" '
	BEGIN {
		split(map, a, ","); 
		for (i in a) { 
                        num  = gensub(/^([ ]*)?([^ ]*)([ ]*)?(.*)$/, "\\2", "g", a[i]) 
			desc = gensub(/^([ ]*)?([^ ]*)([ ]*)?(.*)$/, "\\4", "g", a[i])
 			newnf[num] = desc
		}
	}
	{$NF = newnf[$NF]}1
' input_file
echo "--------------------------------------------------"
mapping="10 Minimal acces, 20 Guest, 30 View, 40 Reporter, 50 Owner,  "
awk -v map="$mapping" '
        NR==FNR{ n=$1; $1=""; gsub(/^ /,"",$0); a[n]=$0; next}
	{ $NF=a[$NF] }1
' <(echo "$mapping" | tr ',' '\n') input_file
