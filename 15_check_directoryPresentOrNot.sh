#!/bin/bash

# Define the directory path

echo "enter the directory"

read "DIR" #/path/to/your/directory


# Check if the directory exists using the -d operator
if [ -d "$DIR" ]; then
    echo "Directory $DIR exists."
else
    echo "Directory $DIR does not exist."
fi
