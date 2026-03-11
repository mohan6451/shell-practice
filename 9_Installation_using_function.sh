#!/bin/bash

userID=$(id -u)

if [ $userID -ne 0 ] ; then 
    echo "error:: Please run the script with root priveleges"
    exit 1  # failure is other than 0
fi

FUNCTION () {

    if [ $1 -ne 0 ] ; then
        echo "Error:: Installing $2 is failed"
        exit 1
    else 
        echo "Installing $2 is Success"
    fi

}

dnf install mysql -y

VALIDATE $? "MySQL"

<< EOF

dnf install nginx -y

VALIDATE $? "Nginx"

dnf install python -y

VALIDATE $? "Python"

EOF