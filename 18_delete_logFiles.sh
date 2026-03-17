#!/bin/bash


R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color
userID=$(id -u)

logs_folder="/var/log/shell_scripting"
script_name=$( echo $0 | cut -d '.' -f1 ) # d is the delimit and '.' is the delimiter. f1 is 1st part & f2 is second part of delimiter.
log_file="$logs_folder/$script_name.log"

mkdir -p $logs_folder
echo "Scripting start time: $(date)" | tee -a $log_file # tee -a -> is used to append, it show on screen on drafted to the logs 

source_dir=/home/ec2-user/app-log

if [ ! -d $source_dir ]; then
    echo -e "ERROR:: $source_dir doesn't exist"
    exit 1
fi

files_to_delete=$(find $source_dir -name "*.log" -type f -mtime +14)

while IFS= read -r filepath
do
    echo "deleting the file: $filepath"
    rm -rf $filepath
    echo "deleted the file: $filepath"
done <<< $files_to_delete









log_filepath=$(find $DIR -name "*.log" -type f -mtime +7)

while IFS= read -r filepath
do
    echo "log file path: $filepath"
done <<< $log_filepath