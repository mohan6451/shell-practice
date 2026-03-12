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
    echo -e "$R error:: Please run the script with root priveleges $NC"
    exit 1  # failure is other than 0
fi

VALIDATE() {

    if [ $1 -ne 0 ] ; then
        echo -e "Error:: Installing $2  $R failed $NC"   | tee -a $log_file
        exit 1
    else 
        echo -e "Installing $2 ... $G Successful $NC"    | tee -a $log_file
    
    fi
}
# $@ -> for all arguments in separate words,

for package in $@ # arguments will provide while running this shell file. 
do 
    # to check package already installed or not 
    dnf list installed $package  &>>$log_file
    
    # if exit status is 0, already installed, -ne 0 means need to install it. 
    if [ $? -ne 0 ]; then 
        dnf install $package -y   &>>$log_file
        VALIDATE $? $package
    else 
         echo -e "$package is already installed. So, $Y Skipping $NC"  | tee -a $log_file   
    fi
    echo "$package package installation completed at time $(date)" | tee -a $log_file
done
