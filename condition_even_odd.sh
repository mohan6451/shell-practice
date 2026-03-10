#!/bin/bash

<<eof
1. take no. and divide by 2
2. if remainder is 0, then it's even. else odd. 
eof

echo "enter the no.:"
read number

if [ $(($number % 2)) -eq 0 ] ; then 
    echo "Given no. $number is EVEN"
else 
    echo "Given no. $number is ODD"
fi