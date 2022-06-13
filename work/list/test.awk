NR==FNR {
    foos[$3] = $1
    bars[$3] = $2
    next
}
$3 in foos {
    print foos[$3] "-" $1, bars[$3] "-" $2, $3
}
