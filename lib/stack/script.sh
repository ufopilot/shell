sed -nE "/$2,(\w+,){5}$3,/p" "$1"
