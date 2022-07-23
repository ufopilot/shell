#!/bin/bash


dbname="_$$.db"
separator=" "
LOAD(){
  local file=$1
  local table=$2
  sqlite3 -separator "${separator}" "${dbname}" ".import ${file} ${table}"
}

SELECT(){
  sqlite3 "${dbname}" "select $@" 
}

CLEAN(){
    rm "${dbname}"
}

LOAD data2 data2
SELECT "* from data2"
CLEAN