#!/bin/bash

# List of services to check
services="java tomcat apache"

# Admin email
admin="admin@gmail.com"

for service in $services
do
    # Check service status using systemctl
    systemctl is-active --quiet $service
    if [ $? -ne 0 ]; then
        # Service is NOT running
        echo "ALERT: $service service is not running on $(hostname)" | mail -s "$service Service Down" $admin
        echo "$service is NOT running, mail sent to $admin"
    else
        echo "$service is running fine"
    fi
done
