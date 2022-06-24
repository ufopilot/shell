awk -v str='"NEW INPUT HERE",' '
    /name/{
           print; 
           getline; 
           le=length($0)-length($1); 
           printf "%*s%s \n%s\n", le, " ", str, $0;
           next
}1' file3.txt

output
name = [
    "NEW INPUT HERE", 
    "victor",
    "linda",
    "harris",
    "sandy"
] 