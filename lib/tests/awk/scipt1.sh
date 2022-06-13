awk -F, '
     function toSeconds(t){  
        cmd="date -d " "\"" t "\""  " +%s"                         # convert date to seconds
        cmd | getline seconds;
        close(cmd);
        return seconds  
    }
    NR==1{
        print                                                       # if line 1 print header
    }
    NR>1{                                                           # if not header line create array
        a[$3][NR]["time"]=$1" "$2                                        # map firm->linenumber->time = value $2                                        
        a[$3][NR]["row"]=$0                                         # map firm->linenumber->row = value $0
    }
    END{
        for(firm in a){                                             # iterating main array a
            if (length(a[firm]) > 3){                               # geting firm length. only if greater 3
                i=1
                for (n in a[firm]){                                 # iterating firm array a[firm]
                    if (i==1) time = a[firm][n]["time"]                     # set init time from first firm row
                    diff = (toSeconds(a[firm][n]["time"]) - toSeconds(time))  # get diff time (row time and init time) 
                    if (diff >= 0 && diff < 30 ) print a[firm][n]["row"]                 # print the complete row saved in array 
                    i++                                                       # if deiff less than 30                              
                }
            }
        }
    }
' input_file