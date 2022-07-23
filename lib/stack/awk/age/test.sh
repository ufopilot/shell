#!/bin/bash

getcolumn(){

  local HEADER=0
  local FNAME=0
  local DELIMITER=" "
  local FILES FNAME

  while getopts "c:d:f:hn" o; do
    case "${o}" in
        c) COLUMN=${OPTARG};;
        d) DELIMITER=${OPTARG};;
        f) FILES=${OPTARG};;
        h) HEADER=1;;
        n) FNAME=1;;
        \?) echo "ERROR: Invalid option -$OPTARG";;
    esac
  done
  shift $((OPTIND-1))

  if [ -z "${COLUMN}" ] || [ -z "${FILES}" ]; then
    echo "Usage: ${FUNCNAME[0]} -c <column> [-d delimiter] [-h] [-n] -f \"file1 file2 ..\"" 1>&2; exit 1; 
  fi

  awk -v col="$COLUMN" -v delimiter="$DELIMITER" -v header="$HEADER" -v fname="$FNAME" '
        BEGIN{ FS=delimiter }
        BEGINFILE{
          if (fname) print "-----" FILENAME "-----"
        } 
        FNR==1{
          delete k; i=0;
          while(i++<NF)k[$i]=i
          if(! header) next 
        }
        { 
          if (col in k == 0){ nextfile }
          print $(k[col]) 
        }
  ' ${FILES}
}

getcolumn -d " " -c surname -c age -f "data*" 
