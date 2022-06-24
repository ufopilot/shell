awk -F'.' -v OFS="." '
    NF==2{
        print
    }
    NF>2{
        $1=""; 
        gsub("/\./","",$0); 
        print    
    }
    ' subdomains.txt 
echo "---------"
awk '
BEGIN {
    FS="."
}
{
    ret = $NF
    if (NF >= 2 && (length($(NF - 1)) == 2 || length($(NF - 1)) == 3)) {
        ret = $(NF - 1) "." ret
        if (NF >= 3) {
            ret = $(NF - 2) "." ret
        }
    } else if (NF >= 2) {
        ret = $(NF - 1) "." ret
    }
    print ret
}
'  subdomains.txt 