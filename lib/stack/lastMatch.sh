awk '/,/ && ++count==1{gsub(/,$/,"")}1' <(tac file)|tac