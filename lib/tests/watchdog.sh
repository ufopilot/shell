#!/bin/bash
mailWorker(){  
    while read -r line; do
        if [[ $line == *$match* ]]
        then
            # mailing
            grep -i "Jobs" "$logfile" | mail -s "Jobs Is Completed" mail@mail.com 
            break
        fi
    done
}

logfile=/path/to/logfile.log
match="jobname" 

if [ ! -f $logfile ]; then
  touch "$logfile"
fi

tail -f --lines=0 "$logfile" | mailWorker