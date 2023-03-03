#!/bin/bash

echo -n "Enter A : "
read A
echo -n "Enter Operator : "
read OP 
echo -n "Enter B : "
read B

case $OP in
    '+') echo "$A + $B = $(expr $A $OP $B )" ;;
    '-') echo "$A - $B = $(expr $A $OP $B )";;
    '*') echo "$A * $B = $(expr $A \* $B )";;
    '/') echo "$A / $B = $(expr $A $OP $B )";;
    *) echo "[FAIL]계산할 수가 없어!!" ; exit 1 ;;
esac

