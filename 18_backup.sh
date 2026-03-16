#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color
userID=$(id -u)
logs_folder="/var/log/shell_scripting"
script_name=$( echo $0 | cut -d '.' -f1 ) # d is the delimit and '.' is the delimiter. f1 is 1st part & f2 is second part of delimiter.
log_file="$logs_folder/$script_name.log"
source_dir=$1
destination_dir=$2

mkdir -p $logs_folder
echo "Scripting start time: $(date)" | tee -a $log_file # tee -a -> is used to append, it show on screen on drafted to the logs 


if [ $userID -ne 0 ] ; then 
    echo -e "$R error:: Please run the script with root priveleges $NC"
    exit 1  # failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <source_dir> <destination_dir>, <days>[optional, default 14 days] $NC"
    exit 1

}

if [ $# -lt 2 ]; then
    USAGE
fi

if [ -d $source-dir ]; then
    echo -e "$R Source dir doesn't exist $NC"
    exit 1
fi

if [ ! -d $destination_dir ]; then
    echo -e "$R destination dir doesn't exist $NC"
    exit 1
fi 