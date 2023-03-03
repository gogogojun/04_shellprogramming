#!/bin/bash
if [ $? -ne 1 ] ; then
    echo "Usage:$0 <U-#>"
    exit 1
fi

FILE=/root/bin/report.txt

NUM=$(echo $1 | awk -F- '{print $2}')

sed -n "/U-$NUM1/,/U-$(expr $NUM1 + 1 )/p" $FILE \
| sed '$d'
