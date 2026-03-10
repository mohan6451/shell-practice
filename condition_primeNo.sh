#!/bin/bash

echo "enter the no.:"
read number

if [ $(($number % 2)) -eq 0 ] ; then 
    echo "Given no. $number is EVEN"
else 
    echo "Given no. $number is ODD"
fi

