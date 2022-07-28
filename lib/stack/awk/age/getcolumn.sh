#!/bin/bash

getcolumns(){
  local OPTIND fname header before after fname
  
  __usage(){
    echo "Usage: ${FUNCNAME[1]} [OPTION]... -c [COLUMN],... [FILE]..."
    echo "Options:"
    echo "  -c <STR,...>   columns to be found"
    echo "  -a <STR>       add string after last column"
    echo "  -b <STR>       add string before first column"
    echo "  -s <STR>       set output delimiter"
    echo "  -d <STR>       set input delimiter"
    echo "  -h             display column header"
    echo "  -n             display filename"
    echo "Example: "
    printf "  %s -d, -s'\\\t' -c name,age file1 file2\n" "${FUNCNAME[1]}"
    exit 1;
  }

  while getopts "a:b:c:d:hns:" o; do
    case "${o}" in
        a) after=${OPTARG};;
        b) before=${OPTARG};;
        c) columns=${OPTARG};;
        d) delimiter=${OPTARG};;
        h) header=1;;
        n) fname=1;;
        s) separator=${OPTARG};;
        \?) echo "ERROR: Invalid option -$OPTARG";;
    esac
  done
  
  shift $((OPTIND-1))

  if [ -z "${columns}" ] || [ "${#}" -eq 0 ]; then
    __usage
  fi

  awk -v columns="$columns" \
      -v delimiter="${delimiter:= }" \
      -v separator="${separator:0 }" \
      -v header="$header" \
      -v fname="$fname" \
      -v before="$before" \
      -v after="$after" '
      BEGIN{ FS=delimiter; OFS=separator; split(columns,cols,",") }
      BEGINFILE{
        if(ERRNO){ print "Error: no such file " FILENAME; nextfile }
        if (fname) print "-----" FILENAME "-----"
      } 
      FNR==1{
        delete key; i=0;
        while(i++<NF)keys[$i]=i
        if(! header) next 
      }
      { 
        before ? out=before OFS : out=""
        #out=""
        for (x in cols){
          if(cols[x] in keys != 0 )
            out=sprintf("%s%s%s", out, $(keys[cols[x]]), OFS)
        }
        after ? out=out after : sub(OFS"$","",out)
      }
      out { print out }
  ' "${@}"
}


getcolumns -d, -c age

getcolumns -d, -s'\t' -c name,age -b "foo" -a "bar baz" file1 file2 
