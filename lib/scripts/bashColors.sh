#!/bin/bash

function color(){ 
    local cl=$1
    shift
    echo "${colors[$cl]}"
    #echo -e "\033[${colors[$cl]}m$@\033[0m"
    printf "\033[%sm%s \033[0m" "${colors[$cl]}" "$@"
}

function bgcolor(){ 
    local cl=$1
    shift
    echo -e "\033[${bgcolors[$cl]}m$@\033[0m"
}

function style(){ 
    local cl=$1
    shift
    echo -e "\033[${styles[$cl]}m$@\033[0m"
}

declare -A colors=(
    ["black"]=30  
    ["red"]=31 
    ["green-light"]=32
    ["yellow"]=33
    ["green"]=34
    ["magenta"]=35
    ["blue"]=36
    ["white"]=37
)

declare -A bgcolors=(
    ["black"]=40
    ["red"]=41
    ["green-light"]=42
    ["yellow"]=43
    ["green"]=44
    ["magenta"]=45
    ["blue"]=46
    ["white"]=47       
)

declare -A styles=(
    ["none"]=0
    ["bold"]=1
    ["italic"]=3
    ["underscore"]=4
    ["blink"]=5
    ["reverseVideo"]=7
    ["concealed"]=8
)


color red sample text
exit
bgcolor blue sample text 
style italic sample text 
style underscore sample text 
color white sample text