#!/bin/bash

IP=server2
UNAME=root
UPASS=centos

CMD() {
		sleep 2 ; echo "$UNAME"
		sleep 1 ; echo "$UPASS"
		sleep 1 ; echo "tar cvzf /tmp/$IP.tar.gz /home"
		sleep 1 ; echo 'exit'
	}
	CMD | telnet $IP

ftp -n $IP 21 << EOF 
    user $UNAME $UPASS
    cd /tmp
    lcd /test
    bin
    hash
    prompt
    mget $IP.tar.gz
    quit
EOF