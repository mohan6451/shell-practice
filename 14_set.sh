#!/bin/bash

#set -e #to stop the script 
set -euo pipefail  


trap 'echo "there is an error in line no.: $LINENO & the command: $BASH_COMMAND"' ERR

echo "testing the set command"
echo "adding error in next line"

asdfsdf #here shell understands there is an error and signal is ERR

echo "after the error"