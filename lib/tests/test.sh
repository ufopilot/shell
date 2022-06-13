upr()
{
    for chr; do
       case $chr in
         [a-z]*) chr_opts="-n" nxt -32 "$chr" ;;
         *) printf "%c${sep}" "$chr" 2>/dev/null ;;
       esac
    done
}


echo '```bash';type upr|sed '1'd;  echo '```'
