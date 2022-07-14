#!/bin/bash

declare -A backup_jobs=(
	[source,1]="/mnt/user/isos" 
        [destination,1]="/mnt/disks/Backup"
        [jobname,1]="isos"
        [foo,1]="foo" 
        [bar,1]="bar"
	[source,2]="/mnt/user/data" 
        [destination,2]="/mnt/disks/Backup" 
        [jobname,2]="backup"
        [foo,2]="foo" 
        [bar,2]="bar"
	[source,3]="/mnt/user/data3" 
        [destination,3]="/mnt/disks/Backup3" 
        [jobname,3]="backup3"
        [foo,3]="foo3" 
        [bar,3]="bar3"
)

#declare -p backup_jobs
LEN=$(tr ' ' '\n' <<<"${!backup_jobs[@]}"|sort -r|sed -n 's/.*,//; 1p')

for((i=1; i<=LEN; i++)); do
   echo "------- Backup $i -------"
   echo "source: ${backup_jobs[source,$i]}"
   echo "destination: ${backup_jobs[destination,$i]}"
   echo "jobname: ${backup_jobs[jobname,$i]}"
done
