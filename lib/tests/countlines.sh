awk 'BEGIN{"wc -l < \""ARGV[1]"\"" | getline max; } {a=$2;getline;print $2-a, $1, max}' sub.txt
