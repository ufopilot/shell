# usage: setarray varname sep string
setarray(){ declare -n a=$1; local IFS=$2 -; set -f; a=($3); }

setarray arr , 1,2,3,
declare -p arr
declare -a arr=([0]="1" [1]="2" [2]="3")

setarray path : "$PATH"
setarray ld_preload ': ' "$LD_PRELOAD" # its elements can be separated by either ':' or spaces