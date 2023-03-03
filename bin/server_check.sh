#!/bin/bash

#export LANG=en_us.UTF-8
DATE=$(date +'%Y.%m.%d %H:%M:%S')
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPUS=$(lscpu | grep '^CPU(s)' | awk '{print $2}')
MEM=$(free -h | grep ^Mem | awk '{print $2}')
DISKS=$(lsblk -S | grep -w disk | wc -l)
TMP1=/tmp/tmp1
#echo -n "Enter your name : "
#read NAME
NAME='GO JUNHO'
cat << EOF
Server Vul. Checker version 1.0
DATE: $DATE
NAME: $NAME

(1) Server information
=================================
OS : $OS
Kernel : $KERNEL
CPU : $CPUS
MEM : $MEM
DISK : $DISKS
EOF

SEQ=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | wc -l)

DNS=$(for i in $(cat /etc/resolv.conf | grep nameserver| awk '{print $2}')
do
    echo -n "$i "
done) 
nmcli connection | grep -vw ' -- ' | tail -n +2 | awk '{print $4}' > $TMP1
for i in $(seq $SEQ)
do
    NIC=$(sed -n "${i}p" $TMP1)
    cat << EOF
Network ${i} ($NIC):
* IP: $(ifconfig $NIC | grep 'inet ' | awk '{print $2}')
* Netmask: $(ifconfig $NIC | grep 'inet ' | awk '{print $4}')
EOF
done 
echo " * Defaultrouter: $(ip route | grep default | awk '{print $3}')"
echo " * DNS: $DNS"