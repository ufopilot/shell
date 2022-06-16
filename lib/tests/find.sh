#find '/images' -maxdepth 1 -name '*jpg' -exec sh -c '''echo mv {} /gallery/$(date --date="today" '+%F')/$(basename {} | sed "s/^.\{,19\}//") && [[ ! ( `date +"%H%M%S"` < 000000 || `date +"%H%M%S"` > 050000 ) ]] && python3 python-script.py "/gallery/$(date --date="today" '+%F')/$(basename {} | sed "s/^.\{,19\}//")"''' \;
#sh: 1: Syntax error: "(" unexpected

awk -F/ '
    function fdate(){
        print |"date --date=today +%F"; getline d; return d
        #"date +%H%M%S"; getline ftime; close("date +%H%M%S")
        #if (ftime > 000000 || ftime < 050000)  py=!py
        #print fdate
    }
    {
        print fdate()
    }
    #py {
    #    print fdate
    #}
    #{    
    #     basename=$NF
    #     gsub(/^.\{,19\}/,basename)
    #     print  "mv " $0 " /gallery/"fdate"/"basename
        
    # }
    
    # / py / {
    #     print  "python3 python-script.py /gallery/"fdate"/"basename
    # }

' <(find './images' -maxdepth 1 -name '*jpg')