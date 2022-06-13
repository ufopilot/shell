awk '$1~/^--$/ {                  # -- starts the header record
    n=split($0,h,/  +/)
    print n             # get field count n of header record
    for(i=1;i<=n;i++)               # iterate fields 
        if(h[i]=="grant (actual)")  # looking for desired header
            break                   # break once found, i is the field number
}
split($0,a,/  +/)==n {              # process records with equal amount of fields
    print a[i]                      # and output ith field
}' dyn_file