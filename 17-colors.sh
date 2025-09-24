#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: please run the script with root privelege"
   exit 1 
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
    echo -e "ERROR:: Installing $$2 ... $R failure $N"
    exit 1 # failure is other than 0

    else
    echo -e "Installing $2 ... $G SUCCESS $N"
    fi
}

if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi

if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

if [ $? -ne 0 ]; then
    dnf install python3 -y
    VALIDATE $? Python3"
else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi

