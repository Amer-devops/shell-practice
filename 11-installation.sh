#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: run the script with root previlage"
    exit 1
fi

dnf install mysql-server -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing Mysql server is failure"
    exit 1
else
    echo "ERROR:: Installing Mysql server is success"
fi
