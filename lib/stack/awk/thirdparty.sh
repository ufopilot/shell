awk '
    FNR==NR && match($0, /(.*\^)(\$third-party)/,p) { a[p[1]]=p[2] ; next}
    ($0 in a ){
        next
    }
    {
        print
    }
' thirdparty.txt thirdparty.txt