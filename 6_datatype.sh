#!/bin/bash

<<EOF

datatype means identifying what kind of data this is and how to handle it. 

EOF

number1=100
number2=300

sum=$(($number1+$number2))

echo "sum of two no. is ${sum}"
-------------------
# array: more than one word allocated for one variable as context. 
# size =4 ->total no. of words
# order is 3 ->order starts from 0d
colleagues=("ramesh" "karthik" "jagan" "brijo")

echo "some of my colleague's are ${colleagues[@]}"


echo "one of my colleague is ${colleagues[$2]}"

echo "one of my colleague is ${colleagues[$3]}"