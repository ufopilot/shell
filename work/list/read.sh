#read   -d' ' INPUT
# echo -e "\nyour input: $INPUT"

awk '
	BEGIN {
    	  printf "Enter the students name: "
          getline name < "-" 
	}
        {
          print name; 
          exit
        }

	$2 == name {
    	print
	}
' input_file 


unset number
until [[ $number == +([0-9]) ]] ; do
    read -r -p "please enter a number: " number
done
echo $((number + 1))

unset input
until [[ "$input" == +([a-zA-Z0-9-_#/]) ]]; do
    read -r -p "please enter a word : " input
done
echo $input
