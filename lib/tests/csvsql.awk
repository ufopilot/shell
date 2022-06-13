#!/bin/bash

csql(){
    case $1 in 
        SELECT)
            #^(\w+)[ ]+(.*)[ ]+(FROM|from)[ ]+(\w+[^ ]*)[ ]?(where|WHERE)?[ ]?(\w+[ ]?)?=?([ ]?\w+)?
            local columns="$2"
            local table="${@: -1}"
            awk -F ',' -v c="$columns" '
            NR==1 {
                for (i=1; i<=NF; i++) {
                  header[$i] = i
                }
                if(c=="*"){
                    cols = header
                }else{
                    cf=split(c, a, ",") 
                    for (i=1; i<=cf; i++) {
                      cols[a[i]] = header[a[i]]
                    }
                }
                for(cl in cols){
                    printf "%s\n", $cols[cl] 
                }
                
            }
            NR>1 {
                for(cl in cols){
                    printf "%s\n", $cols[cl] 
                }
                
            }' "$table"
        ;;
        UPDATE)
            echo ${@: -1}
            awk -F ',' -v id="23" -v salary="20" '
            $1 == id { 
                $3 = salary; 
                print 
            }' data2.csv
        ;; 
    esac
}




csql(){
    db="csql.db$$"
    trap csql_on_exit EXIT
    csql_on_exit(){ rm -f "$db"; }
    csql_usage(){
            echo "csql: exec sql on csv files" 
            echo "  import table: -s <separator> -i -f <file> -t <table>"
            echo "  exec sql:     -s <separator> -e <sql-statement>"
            echo "default separator is ${SEPARATOR}"
            exit 1
            }
    local SEPARATOR=","
    local OPTIND o STATEMENT FILE IMPORT  TABLE
    while getopts ":e:f:his:t:" o; do
        case "${o}" in
            e) STATEMENT="${OPTARG}";;
            f) FILE=${OPTARG};;
            i) IMPORT=1;;
            s) SEPARATOR="${OPTARG}";;
            t) TABLE="${OPTARG}";;
            h) csql_usage
        esac
    done
    shift $((OPTIND-1)) 
    [ -z "${STATEMENT}" -a -z "${IMPORT}" ] && csql_usage
    [ -n "${IMPORT}" ] && {
        sqlite3 "${db}" ".mode csv";
        sqlite3 -separator "${SEPARATOR}" "${db}" ".import \"${FILE}\" \"${TABLE}\"";
        sqlite3 "${db}" ".load /usr/lib/sqlite3/pcre.so";
    }
     
    [ -n "${STATEMENT}" ] && sqlite3 -separator "${SEPARATOR}" "${db}" "${STATEMENT}"
}
#
csql -i -f employees.csv -t employees

csql -i -s "," -f salary.csv -t salary
csql -s ";" -e "select a.Name, b.Salary from employees a, salary b where a.ID = b.ID"


#csql -e "select Name from employees where name REGEXP '^.*on'"