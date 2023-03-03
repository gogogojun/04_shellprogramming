#!/bin/bash

. /root/bin/functions.sh

# 1) telnet server
# 2) ftp server
# 3) ssh server
# 4) web server with nginx

# 1) telnet server
echo "############## TELNET server ##########"
PkgInst "telnet telnet-server"
SvcEnable "telnet.socket"

# 2) ftp server
echo "############## FTP server ##########"
PkgInst "vsftpd ftp"
VsFtpConf
SvcEnable "vsftpd.service"

# 3) ssh server
echo "############## SSH server ##########"
PkgInst "openssh-server openssh-clients openssh"
SshConf
SvcEnable "sshd.service"

# 4) web server with nginx
echo "############## WEB server ##########"
WEBSERVER=$(CheckwebSvc "nginx")
CheckwebSvc "nginx"
PkgInst "nginx"
NginxConf
SvcEnable "nginx.service"