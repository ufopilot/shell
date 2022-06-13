#!/bin/bash

getExtension(){
	local filename=$1
	echo "${filename##*.}"
}

getFilename(){
	#filename=$(basename -- "$fullfile")
	local filename=$1
	echo "${filename%.*}"	
}

getFiedByName(){
	local file=$1
	local delim=$2
	local name=$3
	awk -v delim="$delim" -v name="$name" '
	    NR==1{                          # starts the header record
	    n=split($0,h,delim)             # create header array h. get array lenfth n
	    print n                         # get field count n of header record
	    for(i=1;i<=n;i++)               # iterate fields 
	        if(h[i]==name)              # looking for desired header
	            break                   # break once found, i is the field number
	}
	split($0,a,delim)==n {              # process records with equal amount of fields
	    print a[i]                      # and output ith field
	}' "$file"
}

getRowsInBetween(){
	local file=$1
	local match1=$2
	local match2=$3
	
	awk -v match1="$match1" -v match2="$match2" '
	 /match1/   { outfile="/home/user/split/File" ++i ".txt"; next }
	 /match2/   { close(outfile); outfile=""; next }
	 outfile    { print > outfile }
	 ' "$file"
}

saveRowsInBetween(){
	local file=$1
	local match1=$2
	local match2=$3
	local ofile=$4
	local extfile=$5
	
	awk -v match1="$match1" -v match2="$match2" -v ofile="$ofile" -v extfile="$extfile" '
	 /match1/   { outfile=ofile ++i extfile; next }
	 /match2/   { close(outfile); outfile=""; next }
	 outfile    { print > outfile }
	 ' "$file"
}

removeSpecialCharsFromField(){
	local file=$1
	local delim=$2
	local fieldnr=$3
	awk  -v delim="$delim" -v fieldnr="$fieldnr" '
		BEGIN{OFS=FS=delim}
		{gsub(/[^A-Za-z0-9]/,"",$(fieldnr)); print}' "$1"
}

getBlockS(){
	awk '
	BEGIN                      { COLSEP = "\t"; gcd = ""; ad = ""; cd = ""; flag = 0 }
	/^WBGene/                  { printf "\n%s%s%s%s%s", $1, COLSEP, $2, COLSEP, $3 }
	/^Gene class description:/ { flag = 1; $1=$2=$3=""; }
	/^Automated description:/  { flag = 2; $1=$2=""; }
	/^Concise description:/    { flag = 3; $1=$2=""; }
	/=/                        { flag = 0; printf "%s%s%s%s%s", gcd, COLSEP, cd, COLSEP, ad; gcd = ""; ad = ""; cd = ""}
	flag==1                    { gcd = gcd $0 }
	flag==2                    { ad = ad $0 }
	flag==3                    { cd = cd $0 }
	' c_elegans.PRJNA13758.WS283.functional_descriptions.txt
}


# xargs -i sh -c 'grep -q "{}" a.a || echo "{}"' < p.p