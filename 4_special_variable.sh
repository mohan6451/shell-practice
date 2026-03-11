#!/bin/bash





echo "script: $0" # script name
echo "name: $1"  # for 1st arguments
echo "watch: $2"  # for 2nd arguments
echo "argument_as_seperate_word: $@"  # for all arguments separate words (array)
echo "all_arguments: $*"  # for all arguments as single string (string)
echo "exit_status: $?"  # exit status last command (0 -> success)
echo "processID: $$"  # current script PID
echo "Argument_count: $#"  # argument count
echo "current working directory: $PWD"
echo "who is running: $USER"
echo "home directory: $HOME"

to send any process to background, after the command add "&" Ex: sleep 10 &
echo "PID of the last command in background: $!"



<< EOF

output:

$ sh special_variable.sh mohan titan
 script: special_variable.sh
name: mohan
watch: titan
argument_as_seperate_word: mohan titan
all_arguments: mohan titan
exit_status: 0
processID: 1083
Argument_count: 2
current working directory: /c/Users/mohanraju.k/git/shell-practice
who is running:
home directory: /c/Users/mohanraju.k

EOF