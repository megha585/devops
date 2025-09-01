#!/bin/bash

# Script to check CPU utilization and alert if > 50%

# Get CPU usage (ignoring 'idle' column from top/grep/awk)
CPU_USAGE=$(top -bn1 | grep "CPU(s)" | awk '{print 100 - $8"%"}' | tr -d '%')

echo "Current CPU Usage: $CPU_USAGE%"

if [ "$CPU_USAGE" -gt 50 ]; then
    echo "High CPU usage detected: $CPU_USAGE%" | mail -s "CPU Alert" admin@gmail.com
    echo "Alarm sent to admin@gmail.com"
else
    echo "CPU usage is normal."
fi
