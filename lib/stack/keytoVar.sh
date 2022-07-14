#!/bin/bash


getVal(){
    awk -F "=" -v k="$1" '$1==k{print $2}' <(reformatText2)
}

reformatText2(){
    # format input text to parent_key,child_key,...="value"  
    awk '
        /{|}/ {next} 
        !/^ / {parent_key=$1; next}
        {
            child_key=$1; $1=""; gsub(/^ |;|)|\(/,"")
            if(child_key=="value"){ 
                for (i=1; i<=NF; i++) 
                    printf "%s_%s_%s=\"%s\"\n", parent_key, child_key, i, $i  
            }else{
                printf "%s_%s=\"%s\"\n", parent_key, child_key, $0
            }
        }
        ' file222.txt 
}

reformatText(){
    # format input text to [parent_key,child_key]="value"  
    awk '
        /{|}/ {next} 
        !/^ / {parent_key=$1; next}
        {
            child_key=$1; $1=""; gsub(/^ |;|)|\(/,"")
            if(child_key=="value"){ 
                for (i=1; i<=NF; i++) 
                    printf "[%s,%s,%s]=\"%s\"\n", parent_key, child_key, i, $i  
            }else{
                printf "[%s,%s]=\"%s\"\n", parent_key, child_key, $0
            }
        }
        ' file222.txt 
}


source <(reformatText2)
echo "$water_nu"
echo "$water_rho"
echo "$vapour_rho"
echo "$right_value_2"
echo "$left_value_3"

# show all assignments
reformatText2
exit
reformatText


arrayValues="$(reformatText)"
declare -A myArray="($arrayValues)"
declare -p myArray

echo ${myArray[water,nu]}
echo ${myArray[vapour,rho]}
echo ${myArray[water,rho]}
echo ${myArray[right,value,2]}
echo ${myArray[left,value,3]}

exit

getVal(){
    awk -v k="$1" '
        k=="nu" && $1==k{ gsub(/;/,""); print $2 }
        k=="rho" && $1==k{ rho_arr[$2] }
        k=="value1" && $1=="value" && pre_key=="type" { gsub(/\(/,""); print $3 }
        k=="value2" && $1=="value" && pre_key!="type" { gsub(/\(/,""); print $4 }
        { pre_key = $1 }
        END{
            if(k=="rho") {
                for (i in rho_arr) o=o i
                gsub(/;$/,"", o)
                gsub(/;/,",", o)
                print o
            }
        }
    ' file222.txt
}

NU=$(getVal nu)
RHO=$(getVal rho)
VALUE1=$(getVal value1)
VALUE2=$(getVal value2)

echo nu $NU
echo rho $RHO
echo value1 $VALUE1
echo value2 $VALUE2