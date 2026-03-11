#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color


for package in $@
do 
    echo "these are the $package" 

done



<<EOF

if dnf list installed $package


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
    if dnf list installed $package


done



<<EOF


if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else 
    echo -e "nginx already exist.. $Y skipping $NC"
fi

EOF