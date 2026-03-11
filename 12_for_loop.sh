#!/bin/bash

<<EOF
loops/iterations used for:
1. less code duplication
2. easily maintain
3. dynamic workloads

note: no performance improvement, reduce human efforts by using loops
EOF

for i in {1..10}
do 
  echo $id
done