#!/bin/bash

#while running the script source dir., destination dir. and days need to provide as arguments while running the script. 

R="\e[31m" #Red
G="\e[32m" #Green
Y="\e[33m" #Yellow
NC="\e[0m" #No Color
userID=$(id -u)
logs_folder="/var/log/shell_scripting"
script_name=$( echo $0 | cut -d '.' -f1 ) # d is the delimit and '.' is the delimiter. f1 is 1st part & f2 is second part of delimiter | script: $0" ->script name
log_file="$logs_folder/$script_name.log"
source_dir=$1
destination_dir=$2
days=${3:-14} # if not provided considered as 14days

mkdir -p $logs_folder
echo "Scripting start time: $(date)" | tee -a $log_file # tee -a -> is used to append, it show on screen and drafted to the log.


if [ $userID -ne 0 ] ; then 
    echo -e "$R error:: Please run the script with root priveleges $NC"
    exit 1  # failure is other than 0
fi

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <source_dir> <destination_dir>, <days>[optional, default 14 days] $NC"
    exit 1
}

## check source and destination dir passed or not ##
if [ $# -lt 2 ]; then # $# -> argument count
    USAGE
fi

#check source dir exists
if [ -d $source-dir ]; then
    echo -e "$R Source $source_dir doesn't exist $NC"
    exit 1
fi

#check Destination dir exists

if [ ! -d $destination_dir ]; then
    echo -e "$R destination $destination_dir doesn't exist $NC"
    exit 1
fi 

# find the files
files=$(find $source_dir -name "*.log" -type f -mtime +$days)

if [ ! -z "${files}" ]; then

    # start archeiving
    echo "files found: $files"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILENAME="$destination_dir/app-logs-$TIMESTAMP.zip" 
    echo "zipFileName: $ZIP_FILENAME"
    find $source_dir -name "*.log" -type f -mtime +$days | zip -@ -j "$ZIP_FILENAME" # j -> for simplified file name by eliminating the 
    
    # check archieval success
    if [ -f $ZIP_FILENAME]; 
    then
        echo -e "Archeival ... $G success $NC"
       # deleting the source
        while IFS= read -r filepath
        do
             echo "deleting the file: $filepath"
             rm -rf $filepath
             echo "deleted the file: $filepath"
        done <<< $files

    else 
        echo -e "Archeival ... $R failure $NC"
        exit 1
    fi
else 
    echo -e "no files to archive ... $Y Skipping $NC"
fi 


