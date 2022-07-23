#!/bin/bash

getcolumn(){

  local header=0
  local fname=0
  local delimiter=" "
  local separator=" "
  local fname

  while getopts "c:d:hns:" o; do
    case "${o}" in
        c) column=${OPTARG};;
        d) delimiter=${OPTARG};;
        h) header=1;;
        n) fname=1;;
        s) separator=${OPTARG};;
        \?) echo "ERROR: Invalid option -$OPTARG";;
    esac
  done
  shift $((OPTIND-1))

  if [ -z "${column}" ] || [  "${#}" -eq 0 ]; then
    echo "Usage: ${FUNCNAME[0]} [-h] [-n] [-d <input delimiter>] [-s <output separator>] [-c <column>]  file1 file2 ..." 1>&2; exit 1; 
  fi

  awk -v column="$column" \
      -v delimiter="$delimiter" \
      -v separator="$separator" \
      -v header="$header" \
      -v fname="$fname" '
      BEGIN{ FS=delimiter; OFS=separator; c=split(column,cols,",") }
      BEGINFILE{
        if(ERRNO){ print "Error: no such file " FILENAME; nextfile }
        if (fname) print "-----" FILENAME "-----"
      } 
      FNR==1{
        delete k; i=0;
        while(i++<NF)k[$i]=i
        if(! header) next 
      }
      #! (column in k){ nextfile }
      #{ print $(k[column]) }
      { 
        o=""
        for (x in cols){
          if(cols[x] in k != 0 )
            o=o sprintf("%s%s", $(k[cols[x]]), OFS)
        }
        sub(OFS"$","",o)
        print o
      }
  ' "${@}"
}

getcolumn -h  -c age,name data*
