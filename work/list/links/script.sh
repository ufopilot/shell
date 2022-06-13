awk -F"[ :]" '
      function realpath(f){
         var = "readlink -f " f
         close("readlink -f")
         return var
      }
      {
	close("readlink -f")
      }

      {
         close("readlink -f ")
        print 1, realpath($2)


      }


' input.txt

