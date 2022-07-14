awk -F'[ =]' '
    /coderbyte heroku\/router/{
        gsub(/request_id=/,"",$10); 
        print $10, ($11=="fwd=\"MASKED\"" ? "[M]" : "")
    }
' requestid 
