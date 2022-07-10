awk '
    {
    gsub(/>/, " >")
    for (i=1; i<=NF; i++){
        split($i, a, "=")
        attrib=a[1]
        value=gensub(/"/,"","g",a[2])

        if(attrib == "ExecID"){
            $i = attrib"=\"CANCEL_"value"\""
            execid=value
        }

        if(attrib == "ExecType"){
            if (value == "F") $i = attrib"=\"H\""
        }

        if(attrib == "lm_version"){
            $i = "pb_version=\""value"\""
        }

        if(attrib == "MIDTradingCapacity"){
            $i = "MIFIDTradingCapacity=\""value"\""
            $i = $i " OrdType=\"2\""
        }

        if(attrib == "ReportableEntity"){
            $i = $i " ExecRefID=\""execid "\""
        }
    }
    gsub(/ >/, ">")
    $0 = "<START>\n"$0"\n</START>"
    }1
' log2