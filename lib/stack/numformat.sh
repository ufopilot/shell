sudo find 11 -type f -printf "%s\t%p\n" |sort -n | tail -10 | \
numfmt --to=iec-i --suffix=B --format="%.3f"

$ numfmt --to=iec --suffix=B --format="%.3f" 49532
48.372KB

$ numfmt --to=iec --suffix=B --format="%.3f" 49532058
47.238MB

# iec-i with i "GiB"
$ numfmt --to=iec-i --suffix=B --format="%.3f" 4953205800
4.614GiB

# iec without i "GB"
$ numfmt --to=iec --suffix=B --format="%.3f" 4953205800
4.614GB


# convert from file 
awk '
    function fmt(s){
        "numfmt --to=iec --suffix=B --format=\"%.3f\" " s | getline f; return f
    } { 
        printf "%s %+10s %s\n", $1, fmt($5), $NF
    }' file.ls.txt 