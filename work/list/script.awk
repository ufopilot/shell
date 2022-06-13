BEGIN { FS=OFS="\t" }
    { a[$1] = (NR>FNR ? a[$1] OFS : "") $3 }
END {
    #PROCINFO["sorted_in"] = "@ind_str_asc"
    for (k in a) {
        print k, a[k]
    }
}
