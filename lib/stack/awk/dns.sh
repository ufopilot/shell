#!/bin/bash 

awk -F, -v OFS="\t" 'NR>1{print $1,"IN","A",$2}' machines.csv
    
    #>> cat 