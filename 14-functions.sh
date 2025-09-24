USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: run the script with root privelege"
   exit 1 
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
    echo "ERROR:: Installing $2 is failure"
    exit 1
else
    echo "Installing $2 is SUCCESS"
fi
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install phyton3 -y
VALIDATE $? "python3"
