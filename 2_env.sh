#!/bin/bash

# first have to register the environmental variable by running export <variable>= <content>
# ex: export watch="titan"
echo $watch

# but when the system restart/logged in again it may delete. 

#or else 

#you can add env in the .bashrc file for using this env. it has to be add before the "unset rc" line. 
#after saving the changes. run "source .bashrc" -to source the .bashrc file.

#ex: export watch="titan"  -inside the .bashrc line