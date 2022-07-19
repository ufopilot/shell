



awk '
    #BEGIN{print "BEGIN"} 
    BEGINFILE {
        print "BEGINFILE"
        if(ERRNO){
            print "no such file " FILENAME; 
            nextfile
            #exit
        }
    } 
    { }
     
    ENDFILE{print "ENDFILE"}
    #END{print "END"}
' dddd 