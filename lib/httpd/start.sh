#!/bin/bash
#while [ 1=1 ] ; do echo "TEST" |  nc -l 8080; done
#while true ; do nc -l 80 <index.html ; done 

FILE=$1;
if [ "$FILE" == "" ] ; then echo "Usage: $0 <file-to-serve> [<port:7979>]"; exit; fi
PORT=${2:-7979}
echo Serving $FILE at $PORT, PID: $$
echo $$ > /tmp/serveFilePID-$PORT

while true; do 
    { echo -ne "HTTP/1.0 200 OK\r\nContent-Length: $(wc -c <$FILE)\r\nContent-Disposition: inline; filename=\"$(basename $FILE)\"\r\n\r\n"; cat $FILE; } | nc -l $PORT
    CODE=$?
    #echo "Code: $CODE";
    if [ $CODE -gt 128 ] ; then break; fi;
done;

rm /tmp/serveFilePID-$PORT
