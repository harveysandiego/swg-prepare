#!/bin/bash

#Pause function
function pause()
{
        printf -- "\n\n"
        read -s -n 1 -p "Press any button to continue setup or ctrl+c to quit..."
        printf -- "\n\n"
}

#Oracle 19c Preinstall Pack
printf --  "\nRun Oracle Preinstall pack\n"
cd ~/ora_dependencies
sudo yum -y localinstall oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm

#Set Paths in Oracle bashrc
printf --  "\nQue Set PATHs\n"
pause
sudo ~/swg-prepare/oracle_paths.sh

#Make directories and extract
echo "Making directories and extracting Oracle DB"
pause
sudo mkdir -p /u01/app/oracle/product/19.3.0/dbhome_1
sudo unzip -d /u01/app/oracle/product/19.3.0/dbhome_1/ LINUX.X64_193000_db_home.zip
sudo chown -R oracle:oinstall /u01
sudo chmod -R 775 /u01

printf --  "\nQue install scripts for transfer to Oracle user\n"
pause
~/swg-prepare/oracle_user.sh