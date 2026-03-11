#!/bin/bash


#Time: date --help -> for help
#date                       -> Tue Mar 10 12:59:39 IST 2026
#date +%y-%m-%d=%H-%M-%S    ->  26-03-10=12-57-45

start_time=$(date +%s)

#assume for executing script it take 14 sec.
sleep 5 

end_time=$(date +%s)

total_time=$(($end_time-$start_time))

echo "Time for execution of script is $total_time sec"
