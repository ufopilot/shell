#!/bin/bash

FILE="male.csv"

# awk
awk 'BEGIN{OFS=FS=","} NR!=1{$5=="Male" ? $5="m" : $5="f"}1' "$FILE" #> output1.csv
echo 

# bash
while read line 
do
    line=${line/,Male,/,m,}
    line=${line/,Female,/,f,}
    echo $line
done  < "$FILE" # > output2.csv
echo

# sed
sed 's/,Male,/,m,/; s/,Female,/,f,/' "$FILE" > output3.csv
echo