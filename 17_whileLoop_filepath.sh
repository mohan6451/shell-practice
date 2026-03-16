#!/bin/bash

echo "enter the directory"

read "DIR" #/path/to/your/directory

<< EOF
# Check if the directory exists using the -d operator
if [ -d "$DIR" ]; then
    echo "Directory $DIR exists."
else
    echo "Directory $DIR does not exist."
fi
EOF

log_filepath=$(find $DIR -name "*.log" -type f -mtime +7)

while IFS= read -r filepath
do
    echo "log file path: $filepath"
done <<< $log_filepath