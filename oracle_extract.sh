#!/bin/bash

#Oracle 19c Preinstall Pack
cd ~/ora_dependencies
yum -y localinstall oracle-database-preinstall-19c-1.0-1.el7.x86_64.rpm

#Make directories and extract
echo "Making directories and extracting Oracle DB"
mkdir -p /u01/app/oracle/product/19.3.0/dbhome_1
unzip -d /u01/app/oracle/product/19.3.0/dbhome_1/ LINUX.X64_193000_db_home.zip
chown -R oracle:oinstall /u01
chmod -R 775 /u01

echo "Setting password for Oracle user"
#set Oracle User Password
printf -- "oracle:swgevolve" | chpasswd