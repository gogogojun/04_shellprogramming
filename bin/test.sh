#!/bin/bash

NUM=1
NUM2=10
#echo -ne "50% |"


for i in $(seq 10)
do
PRESENT=$(expr $i \* 10)
echo -n "${PRESENT}%|"


for j in $(seq $i)
do
    echo -ne "="
done
[ $i -le 9 ] && echo -ne ">" || echo -ne "| complete\n"

echo -ne "\r"
sleep 1
done
if [ $i -le 9 ] ; then
    echo -en ">"
else
    echo -en ""