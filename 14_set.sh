#!/bin/bash

#set -e #to stop the script 
set -euo pipefail  


error(){

echo "there is an error"

}

trap error ERR


echo "testing the set command"
echo "adding error in next line"

asdfsdf

echo "after the error"