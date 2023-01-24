#!/bin/bash

#Make directories and extract
echo "Making directories and extracting Oracle DB"
mkdir -p /u01/app/oracle/product/19.3.0/dbhome_1
unzip -d /u01/app/oracle/product/19.3.0/dbhome_1/ LINUX.X64_193000_db_home.zip
chown -R oracle:oinstall /u01
chmod -R 775 /u01