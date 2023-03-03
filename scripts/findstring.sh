#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "usage:<pattern><filename>"
    exit 1
fi
PATTERN=$1
FILE1=$2

grep $PATTERN $FILE1 > /dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "[ok] 찻았당~~~~~"
else
    echo "fail 못 찾았당~~"
fi