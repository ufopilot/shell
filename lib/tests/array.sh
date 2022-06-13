#!/bin/bash
cmd (){
    readarray -d "  " arr <<<"$@"
    for ((i=0; i<${#arr[@]}; i+=2))
    do
        n=$(($i+1))
        firstFile="${arr[$i]}"
        secondFile="${arr[$n]}"
        echo "pair --  ${firstFile} && ${secondFile}"
    done
}

cmd file*_[12].txt