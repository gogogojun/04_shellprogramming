#!/bin/bash

IP1=121.166.34.190
PORT=21

ftp -n $IP1 $PORT << EOF
user user01 user01
cd share
lcd /test
bin
hash
prompt
mput s1.txt
quit
EOF