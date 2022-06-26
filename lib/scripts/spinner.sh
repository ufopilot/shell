#!/bin/bash

spinner () {
    local chars=('|' / - '\')
    # hide the cursor
    tput civis
    trap 'printf "\010"; tput cvvis; return' INT TERM

    printf "\033[36m⯈ %-30s\033[0m" "$*"

    while :; do
        for i in {0..3}; do
            printf "%s" "${chars[i]}"
            sleep 0.3
            printf '\010'
        done
    done  
}

killSpinner(){
    local pid="$1"
    local rc="$2"
   # kill spinner, and wait for the trap commands to complete
    kill "$pid"
    wait "$pid"
    if [[ "$rc" -eq 0 ]]; then
        echo -e "\033[34m✔ SUCCESS\033[0m"
    else
        echo -e "\033[31m✘ ERROR\033[0m"
    fi
    #https://www.compart.com/de/unicode/category/So ➤
}
func1 ()
{
    local pid rc
    echo "Start function 1"
    spinner "Executing ${FUNCNAME[0]} ... " & pid=$!
    #------------------------------------
    # your command here >/dev/null 2>&1
    sleep 2
    #------------------------------------
    rc=$?
    killSpinner "$pid" "$rc"
    return $rc
}

func2 ()
{
    local pid rc
    echo "Start function 2"
    spinner "Executing ${FUNCNAME[0]} ... " & pid=$!
    #------------------------------------
    # your command here >/dev/null 2>&1
    sleep 2
  
    #------------------------------------
    rc=$?
    killSpinner "$pid" "$rc"
    return $rc
}

func3 ()
{
    local pid rc
    echo "Start function 3"
    spinner "Executing ${FUNCNAME[0]} ... " & pid=$!
    #------------------------------------
    # your command here >/dev/null 2>&1
    sleep 2
    lss >/dev/null 2>&1
    #------------------------------------
    rc=$?
    killSpinner "$pid" "$rc"
    return $rc
}

func1 &&
func2 &&
func3