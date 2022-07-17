#!/bin/bash

export str1="$(echo 'foo')"; 
export str2="$(echo 'bar')"; 
export str3="$(echo ${str1}${str2})";
awk 'BEGIN{print ENVIRON["str1"], ENVIRON["str2"], ENVIRON["str3"]}'
