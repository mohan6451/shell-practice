#!/bin/bash


echo "please enter the password"

name PASSWORD  # Here password is variable

echo "password entered is: $PASSWORD"

# If you run the above script password is visible on the screen and noted the history

---------------------------

echo "please enter the password"

name -s PASSWORD  # if -s is added then the password will not be visible on screen while typing and also in the history

echo "password entered is: $PASSWORD"