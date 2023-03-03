#!/bin/bash
#   # cat user.list
#   user50 user50
#   user51 user51
#   ....
#   user100 user100

START=50
END=100
FILE1=/root/bin/user.list
> $FILE1

for i in $(seq $START $END)
do
    #echo "$i"
    echo "user$i user$i" >> $FILE1
done