#!/bin/bash

ff=1
for i in $(seq 3) #cat /root/bin/pv1.txt)
do
    echo "$i"
    expr $ff + 1
done