awk -v col="1" '
    {
        split($(col), a, ".")
        parent = a[1]"."a[2]
        if ($(col) != parent ){
            map[parent]["childcount"]++
            map[parent]["children"][i++]=$(col)
        
        }else{
            map[parent]["childcount"] = 0
        }
    }
    END{
        for (parent in map){
            print parent, map[parent]["childcount"]
            if (map[parent]["childcount"] == 0) continue
            for (child in map[parent]["children"]){
              print map[parent]["children"][child], "."
            }
        }
    }
' filterParentChild.txt