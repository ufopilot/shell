#!/bin/bash
site=https://www.google2.com
status=down 
interval=5

until [ "$status" = "up" ]; do
    if grep -q "^HTTP/.*200" <(curl -s --head  --request GET "$site"); then 
      # send mail up
      echo "# send mail up"
      status=up
    else
      if [ -z "$mail" ]; then
         # send mail down
         echo "# send mail down"
         mail="done"
      fi 
      echo "wait ..." 
      sleep "$interval"
    fi
done
