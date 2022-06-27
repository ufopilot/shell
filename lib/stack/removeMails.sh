awk -F@ -i inplace ' # set delimiter @ and inplace option to save changes
  NR==FNR{           # current record num match the file record num remove_users.txt 
      a[$1];         # create entry in array a with username
      next           # grab the next line dont process the next block
  }   
                     # second file emails.txt   
  !($1 in a) {       # if username in array a
      print          # print user-email line                  
  }                  # inplace::enable=0/1 false/true
' inplace::enable=0 remove_users.txt inplace::enable=1 emails.txt 
