awk -F, '
    function epoche(dtt){
        "date -d \""dtt"\" +%s < \""ARGV[1]"\"" | getline e; return e
    }
    {
        print epoche($1),$2, ARGV[1]
    }
    ' file.txt