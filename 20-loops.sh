#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" # /var/log/shell-script/16-logs.log

mkdir -p $LOGS_FOLDER
echo -e"Script started started at: $R $($date) $N" | tee -a $LOG_FILE

START_TIME=$(date +%s)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 # failure is other than 0
fi

VALIDATE(){ # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2 ... $R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2 ... $G SUCCESS $N" | tee -a $LOG_FILE
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

END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME - $START_TIME))
echo -e "time taken for execution : $Y $TOTAL_TIME Seconds $N"