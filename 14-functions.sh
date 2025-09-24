USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR:: run the script with root privelege"
   exit 1 
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MySQL is failure"
    exit 1
else
    echo "Installing MySQL is SUCCESS"
fi


dnf install nginx -y

if [ $? -ne 0 ]; then
   echo "ERROR:: Installing Nginx is failure"
   exit 1
else
   echo " Installing Nginx is success"
fi


