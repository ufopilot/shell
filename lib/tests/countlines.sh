awk 'BEGIN{"wc -l < \""ARGV[1]"\"" | getline max; } {a=$2;getline;print $2-a, $1, max}' sub.txt
#$ awk 'BEGIN{"grep copied "ARGV[1]"|tail -1"|getline;print $1}' data3.txt 

# str='# {"$imagepolicy": "xxx:xxx-test-pr333" }'
# $ awk -F"\t" -v s="$str" '/image:/{$++NF=s}1' data4.txt 