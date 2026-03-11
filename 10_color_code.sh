#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color


#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo -e "$R error:: Please run the script with root priveleges $NC"
    exit 1  # failure is other than 0
fi

VALIDATE() {

    if [ $1 -ne 0 ] ; then
        echo -e "$R Error:: $NC Installing $2 is $R failed $NC"
        exit 1
    else 
        echo -e "$G Installing $2 is Success $NC"
    fi
}

dnf list installed nginx
if [$? -ne 0] then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    echo -e "nginx already exist.. $Y skipping $NC"

dnf list installed python3
if [$? -ne 0] then
    dnf install python3 -y
    VALIDATE $? "python"
else 
    echo -e "python3 already exist.. $Y skipping $NC"

