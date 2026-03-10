#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo "error:: Please run the script with root priveleges"
    exit 1  # failure is other than 0
fi

dnf install mysql -y

if [ $? -ne 0 ] ; then
    echo "Error:: Installing MySQL is failed"
    exit 1
else 
    echo "Installing MySQL is Success"
fi


dnf install nginx -y

if [ $? -ne 0 ] ; then
    echo "Error:: Installing nginx is failed"
    exit 1
else 
    echo "Installing nginx is Success"
fi

