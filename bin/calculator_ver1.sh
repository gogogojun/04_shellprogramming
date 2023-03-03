#!/bin/bash


echo -n "Enter A: "
read NUM1

echo -n "Enter B: "
read NUM2

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF
echo -n "Enter your choice (1|2|3|4) : "
read OP

case $OP in
    1) echo "$NUM1 + $NUM2 =$(expr $NUM1 + $NUM2)" ;;
    2) echo "$NUM1 - $NUM2 =$(expr $NUM1 - $NUM2)"  ;;
    3) echo "$NUM1 x $NUM2 =$(expr $NUM1 \* $NUM2)" ;;
    4) echo "$NUM1 / $NUM2 =$(expr $NUM1 / $NUM2)" ;;
    *) echo "[FAIL] 계산할 수 없어유~" ; exit 1 ;;
esac