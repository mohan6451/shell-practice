#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo "error:: Please run the script with root priveleges"
    exit 1  # failure is other than 0
fi

VALIDATE() {

    if [ $1 -ne 0 ] ; then
        echo "Error:: Installing $2 is failed"
        exit 1
    else 
        echo "Installing $2 is Success"
    fi
}

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
dnf install https://repo.mysql.com/mysql80-community-release-el9-1.noarch.rpm
dnf install mysql-community-server -y
VALIDATE $? "mysql-"

<<EOF
dnf install nginx -y
VALIDATE $? "Ngin2"

dnf install python -y
VALIDATE $? "Python"
EOF