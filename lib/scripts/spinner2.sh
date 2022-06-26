spinner2(){
    while :;do 
        for s in / - \\ \|;do 
            #printf "\r[$s] ${bold}$1$reset\r";
            printf "%s" "${s}"
            printf '\010'
            sleep 0.2;
        done
    done
}

spinner() {
    local chars=('|' / - '\')
    # hide the cursor
    tput civis
    trap 'printf "\010"; tput cvvis; return' INT TERM

    printf "\033[36m⯈ %-50s\033[0m" "$*"

    while :; do
        for i in {0..3}; do
            printf "%s" "${chars[i]}"
            sleep 0.3
            printf '\010'
        done
    done  
}

func1(){

    echo "Start Function 1"
    spinner "func1" & PID="$!"
    sleep 2 
    kill ${PID}
}

func2(){
    echo "Start Function 2"
    spinner "func2" & PID="$!"
    sleep 3   
    kill ${PID}
}

func3(){
    echo "Start Function 3"
    spinner "func3" & PID="$!"
    sleep 5  
    kill ${PID}
}

func1 &&
func2 &&
func3