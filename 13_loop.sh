#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color


userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo -e "$R error:: Please run the script with root priveleges $NC"
    exit 1  # failure is other than 0
fi

VALIDATE() {

    if [ $1 -ne 0 ] ; then
        echo -e "Error:: Installing $2  $R failed $NC"
        exit 1
    else 
        echo -e "Installing $2 ... $G Success $NC"
    fi
}
# $@ -> for all arguments in separate words

for package in $@
do 
    # to check package already installed or not
    dnf list installed $package 
    
    # if exit status is 0, already installed, -ne 0 means need to install it. 
    if [$? -ne o]; then 
        dnf install $package -y
        VALIDATE $? $package
    else 
         echo -e "$package is already installed. So, $Y Skipping $NC"
    fi

done



<<EOF




<<EOF


if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    echo -e "nginx already exist.. $Y skipping $NC"
fi

EOF