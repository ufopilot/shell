#!/bin/bash

#Colors
BRed='\033[1;31m'
Green='\033[0;32m'
BCyan='\033[1;36m'
NC='\033[0m'

f1(){
  echo "${FUNCNAME[0]}" 
}
f2(){
  echo "${FUNCNAME[0]}" 
}
f3(){ 
  echo "${FUNCNAME[0]}" 
}
f4(){
  echo "${FUNCNAME[0]}" 
}
f5(){
  echo "${FUNCNAME[0]}" 
}
f6(){
  echo "${FUNCNAME[0]}" 
}
Help(){
  echo "${FUNCNAME[0]}" 
}

if [ $# -eq 0 ]
then
    PS3='Please enter your choice: '
    options=("Point1" "Point2" "Point3" "Point4" "Point5" "Help" "Quit")
    select opt in "${options[@]}"
    do
        case $opt in
            "Point1")
                f1;;
            "Point2")
                f2; f3;;
            "Point3")
                f2; f4;;
            "Point4")
                f5;;
            "Point5")
                f6;;
            "Help")
                Help;;
            "Quit")
                break;;
            *) echo -e "${BRed}Selected option ${BCyan}'$REPLY'${NC} ${BRed}couldn't be find in the list of provided options${NC}"
                break;;
        esac
    done
fi

# while getopts :c:i:u:d:s:h: OPTION
while getopts "ciudsh" OPTION
do
        case $OPTION in
                c)
                    f1;;
                i)
                    f2; f3;;
                u)
                    f2; f4;;
                d)
                    f5;;
                s)
                    f6;;
                h)
                    Help;;
                *) echo -e "${BRed}Wrong argument ${BCyan}'$OPTARG'${NC} ${BRed}provided, run${NC} ${BCyan}sh $0 -h${NC} ${BRed}for help${NC}"
        esac
done
