#!/bin/bash

<< EOF

A while loop in shell scripting repeatedly executes a block of code as long as a specified condition remains true (returns an exit status of zero). It is primarily used when the number of iterations needed is unknown in advance, such as when reading a file line by line or validating user input



i=1
while [ $i -le -4 ]; do
  echo "Number: $i"
  ((i++)) # Increment the counter
done

EOF


# Set IFS to comma (,) only for the read command
# IFS (Internal Field Separator)
while IFS= read -r lines
do
  # Process the variables
  echo "prcessing lines: $lines"

done < script1.sh
