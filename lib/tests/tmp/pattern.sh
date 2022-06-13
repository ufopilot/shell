#awk '
#   /^pattern$ || ^pattern 2$/{ 
#	getline; getline; getline
#        o=$0; 
#	getline; getline; 
#        print o,$0
#   }
#' pattern.txt
pasteRows(){
  local pattern1="$1"
  local pattern2="$2"
  local frow="$3"
  local srow="$4"
  
  awk -v pat1="$pattern1" -v pat2="$pattern2" -v r1="$frow" -v r2="$srow" '
   { 	
	if($0 == pat1 || $0 == pat2) {i=0; p=$0; next}
   	i++; a[p][i] = $0
   } 
   END{for(e in a) print a[e][r1],a[e][r2]}
  ' pattern.txt
}

pasteRows pattern "pattern 2" 3 5
pasteRows pattern "pattern 2" 1 4
