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

for package in $@
do
    dnf list installed $package &>>$LOG_FILE

    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "Already installed...$Y SKIPPING $N"
    fi

done