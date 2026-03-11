#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color
logs_folder="/var/log/shell_scripting"
script_name=$( echo $0 | cut -d '.' -f1 ) # d is the delimit and '.' is the delimiter. f1 is 1st part & f2 is second part of delimiter.
log_file="$logs_folder/$script_name.log"

sudo mkdir -p $logs_folder
echo "Scripting start time: $(date)" | tee -a $log_file # tee -a -> is used to append, it show on screen on drafted to the logs 

userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo -e "$R error:: Please run the script with root priveleges $NC"  &>>$log_file
    exit 1  # failure is other than 0
fi




VALIDATE() {

    if [ $1 -ne 0 ] ; then
        echo -e "Error:: Installing $2  $R failed $NC"  &>>$log_file
        exit 1
    else 
        echo -e "Installing $2 ... $G Success $NC"  | tee -a $log_file 
    fi
}

dnf list installed nginx   &>>$log_file

if [ $? -ne 0 ]; then
    dnf install nginx -y   &>>$log_file
    VALIDATE $? "Nginx"
else 
    echo -e "nginx already exist.. $Y skipping $NC"   &>>$log_file
fi

dnf list installed python3    &>>$log_file
if [ $? -ne 0 ]; then
    dnf install python3 -y      &>>$log_file
    VALIDATE $? "python"
else 
    echo -e "python3 already exist.. $Y skipping $NC"      &>>$log_file
fi


echo "script end date: $(date)" | tee -a $log_file