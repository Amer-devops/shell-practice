#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: please run the script with root previlage"
    exit 1 # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing Mysql server is failure"
    exit 1
else
    echo "ERROR:: Installing Mysql server is success"
fi
