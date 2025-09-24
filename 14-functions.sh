#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: please run the script with root privelege"
   exit 1 
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 is failure"
    exit 1 # failure is other than 0

    else
    echo "Installing $2 is SUCCESS"
    fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"




