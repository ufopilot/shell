

cat demidecode.txt | awk -F: '
    BEGIN{i=1;}
    /^Memory Device/{ name="Memory"i++} 
    /^ *Size:/{size=$2}
    /^ *Speed:/{speed=$2}
    /^ *Volatile Size:/{
        print name
        print "\t",speed
        print "\t",size
        print "\t",$2
    } 
'