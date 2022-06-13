awk '
      $1 == "header" { f=NR; map[f]["header"]=$0 }

      $1 != "header" {
        map[f]["row"NR]=$0

      }
      END{
        for(n in map){
	  print map[n]["header"]
	  for(x in map[n]){
	    if (x != "header"){
	      split(map[n][x], a, " ")
	      print map[n][x]
            }
          }
	}
      }
   
' input_file
