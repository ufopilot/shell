#!/bin/bash

set_config(){ 
    echo "Set configuartion"; 
}

exec_installer(){ 
    echo "Execute installation"; 
}

main(){
    select opt in "${options[@]}"
    do
        case $opt in
            "1")
                set_config
                break
                ;;
            "2")
                set_config
                exec_installer
                break
                ;;
            "3")
                echo "Setting configuration and execution Unlink"
                break
                ;;
            "4")
                echo "Running tests"
                break
                ;;
            "Quit")
                break
                ;;
            *) echo "Selected option '$REPLY' couldn't be find in the list of options";;
        esac
    done
}

PS3='Please enter your choice: '
options=("1" "2" "3" "4" "Quit")


default_opt=$1
if [ "$default_opt" -gt 0 ]; then 
    yes "$default_opt" | main
else
    main
fi