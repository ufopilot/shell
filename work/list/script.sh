#!/bin/bash


MYDB="/opt/dev/shell/work/list/mydb.sql"

execTask(){
   local id=$1
   task=$(sqlite3 mydb.sql "select name from tasks where id = $1")
   [ -z "$task" ] && { echo "no task found for id $id" ; return 1; } 
   echo "exec task $task"
   python3 $task
}  


execTask 1
sleep 10
execTask 2
sleep 10
execTask 3


