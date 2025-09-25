#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOG_FILE

LOG_FOLDER= "/var/log/shell-practice"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

if [ $USERID -ne 0 ]; then
   echo " please run the script with root previlage"
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
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MySQL" 
else
    echo -e "MySQL already exist ... $Y SKIPPING $N"
fi

if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exist ... $Y SKIPPING $N"
fi

if [ $? -ne 0 ]; then
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? Python3
else
    echo -e "Python3 already exist ... $Y SKIPPING $N"
fi

