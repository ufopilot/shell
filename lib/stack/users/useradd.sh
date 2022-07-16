#!/bin/bash

usage(){
    echo "$0 <userlist-file>"    
    echo "Please specify an input file!"; 
    exit 10;
}

# User List File
[ $# -eq 0 ] &&  usage  || USERLIST="$1"

if [ -f "$USERLIST" ]; then

    while IFS=, read -r userid userinfo
    do
        echo "Creating the $userid user, poulating the user info, and setting initial password..."
        echo "useradd -m -c \"$userinfo\" \"$userid\" ..."
        #useradd -m -c "$userinfo" "$userid" && echo "$userid:<PASSWORD>" | chpasswd && passwd -e "$userid"   
    done < "$USERLIST"

    echo "User must change password upon first login."
    exit 20
else
    echo "Invalid input file specified!"
    exit 30
fi
