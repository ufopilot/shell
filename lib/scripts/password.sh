


lengthOf(){ [[ ${#1} -ge $2 ]] || return 1; }
hasLowerChar(){ [[ "$1" == *[a-z]* ]] || return 1; }
hasUpperChar(){ [[ "$1" == *[A-Z]* ]] || return 1; }
hasNumber(){ [[ "$1" == *[0-9]* ]] || return 1; }

pass="aaaaaaaaaaaa"
lengthOf $pass 11  || echo "Password is too shor"; exit 1  
hasLowerChar $pass || echo "Password has no lowercase chars"; exit 1 
hasUpperChar $pass || echo "Password has no uppercase chars"; exit 1 
hasNumber $pass    || echo "Password has no numbers"; exit 1 
