rdom () { local IFS=\> ; read -d \< E C ;}
myArray=()
while rdom; do 
   [ "$E" = "name" ] && name=$C 
   [ "$E" = "code" ] && code=$C 
   [ "$E" = "format" ] && { format="$C"; myArray+=("$name-$code-$format"); } 
done < input.xml

declare -p myArray


## Using xq (jq syntax) (to get xq --> pip install yq)

readarray -t myArray < <(xq -r '.config.input[].pattern | "\(.name)-\(.code)-\(.format)"' input.xml)
declare -p myArray
declare -a myArray=([0]="ABC-1234-txt" [1]="XYZ-7799-csv")


#Using awk

readarray -t myArray < <(awk -F"</?(name|code|format)>" '/<name>/{n=$2;getline;c=$2;getline;print n"-"c"-"$2}' <(xmllint --format input.xml))
declare -p myArray
declare -a myArray=([0]="ABC-1234-txt" [1]="XYZ-7799-csv")


#Using grep & sed

readarray -t myArray < <(xmllint --format input.xml|grep -E '<name>|<code>|<format>'|sed -E 'N;N;s/\n/-/g; s/<\/?\w+>//g; s/ //g')
declare -p myArray
declare -a myArray=([0]="ABC-1234-txt" [1]="XYZ-7799-csv")
