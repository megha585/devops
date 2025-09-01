#!/bin/bash

#diskspace usage 
#usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

usage=$(df -h .|tail -1|awk -F " " '{print $( NF-1 )}'|sed 's/%//g')

# Check if usage is greater than or equal to 90
if [ $usage -ge 90 ]; then
    echo "ALERT: Disk space is full ($usage%)."
else
    echo "Disk space is OK ($usage%)."
fi 

