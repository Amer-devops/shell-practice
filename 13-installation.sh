#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: run the script with root privelege"
   exit 1 
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "ERROR:: Installing Nginx is failure"
   exit 1
else
   echo "ERROR:: Installing Nginx is success"
fi