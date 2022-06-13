#!/bin/bash

# factorial program using a function with while loop

 calculate_factorial () {
         result=1
         case $1 in 
             -*) result="The number cannot be negative"; rc=1;;
             #0)  rc=0;;
             *[a-zA-Z]*) result="Only numbers allowed"; rc=1;;  
             *)  for ((i=$1; i>1; i--)); do
                   result=$(( result*i ))
                 done
                 rc=0
         esac
         echo $result
         return $rc
 }

calculate_factorial $1
calculate_factorial(){
    awk '
        $0<0  {print "The number cannot be negative"; exit 1}
        ! /^[[:digit:]]*$/ { print "Only diggits allowed"; exit 1}
        {
            result=1;
            for(i=$0;i>1;i--) result=result*i;
            print result
        }
    ' <<<"$1"
    return $?
}
