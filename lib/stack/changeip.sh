# awk '
#     function getIp(n){
#         "grep -n \"$n\" " ARGV[2] "|cut -d: -f1"| getline lineNr;
#         "sed -n \"$lineNr\"p " ARGV[3] | getline ip; return ip 
#     }
#     NR==FNR{
#       $2 == "No_IP_Found" ? $2=getIp(NR) : $2 
#         print 
#     }

# ' fileA.txt linenum.txt ipaddr.txt | column -t
awk -i inplace '
    NR==FNR { a[$1]=$2; next }
    $2 == "No_IP_Found" && a[FNR]{$2 = a[FNR]}
    {
        printf "%s %s %-16s %s\n", $1, FS, $2, $3
    }
' inplace::enable=0 <(paste linenum.txt ipaddr.txt) inplace::enable=1 fileA.txt

#fileA.txt linenum.txt ipaddr.txt