#!/bin/bash

if [ $# -ne 1 ] ; then
    echo "usage: $0 <filename>"
    exit 2
fi
FILE1="$1"
 
FILESIZE=$(wc -c < "$FILE1")
# echo $FILESIZE

if [ $FILESIZE -ge 5120 ] ; then
    echo "엄청 크네~~~~($FILESIZE bytes)"
else
    echo "너무 작네~~~~($FILESIZE bytes)"
fi