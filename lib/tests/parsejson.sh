FILE="input.json"
paste -d@ \
    <(jq -r '.[]|select(.Key|contains("/username")).Val' $FILE) \
    <(jq -r '.[]|select(.Key|contains("/ip")).Val' $FILE) | \
    sort -u

echo "------------"

cat $FILE | jq -r '.[]|select(.Key|test("(username|ip)$")).Val'   | paste -d '@' - - | sort -u |awk -F@ '{$0=$2"@"$1}1'

echo "------------"
awk -F: '
    BEGIN{OFS="@"}
    /\/ip/{
        getline;
        ip=$2
        gsub(/[ "]/, "", ip)
    }
    /username/{        
        getline;
        username=$2
        gsub(/[ "]/, "", username)
        print username,ip
        #printf "%s@%s\n",$4,ip
    }
    
' "$FILE"|sort -u

echo "------------"
awk -F: '
    /\/ip/{
        getline;
        ip=$2
        gsub(/[ "]/, "", ip)
    }
    /username/{
        getline;
        username=$2
        gsub(/[ "]/, "", username)
        printf "%s@%s\n",username,ip
    }
' "$FILE"|sort -u

echo "------------"
awk -F\" '
    /\/ip/{getline;ip=$4}
    /username/{
        getline;
        $0=$4"@"ip
        print |"sort -u"
        }
' input.json 

#awk -F\" '/\/ip/{getline;ip=$4}/username/{getline;printf "%s@%s\n",$4,ip}' "$FILE"|sort -u
