#!/bin/bash

service_ui_staus(){
    command to check the deployment of UI service 2>&1|grep -q "Completed" && return 0
    return 1
}

service_db_staus(){
    command to check the deployment of DB service 2>&1|grep -q "Completed" && return 0
    return 1
}

deployment_status(){
    if service_ui_staus && service_db_staus; then return 0; fi
    return 1
}

counter=0
maxcount=5
waittime=10
while :; do
    ((counter++))
    if deployment_status; then 
      echo "Deployments done..."
      # more actions ....
      # .
      # .
      break
    fi 
    if  [ "$counter" -eq "$maxcount" ]; then 
        echo "Maximum counter reached. Deployment not done"; 
        break 
    else 
        echo "waiting $waittime seconds ..."  
        sleep "$waittime"
    fi
done
