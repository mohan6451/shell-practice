#!/bin/bash

number=$1

if [ $number -lt 10 ] ; then 
    echo "Given no. $number, is less than 10"
elif [ $number -eq 10 ] ; then
    echo "Given no. $number, is equal to 10"
else 
    echo "Given no. $number, is greater then 10"
fi

<<eof
less then  -> -it 
greater than -> -gt
equal to -> eq
not equal to -> ne
eof