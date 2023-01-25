#!/bin/bash

#Pause function
function pause()
{
        printf -- "\n\n"
        read -s -n 1 -p "Press any button to continue setup or ctrl+c to quit..."
        printf -- "\n\n"
}

printf --  "\n####################\n\nWelcome to the SWG Server Preparation Script!\nThis script is designed primarily for Oracle Linux 8.\nThis may not work on distros without those available packages.\n\n####################\n"

pause

printf --  "\nInitializing Server and Checking for updates\n"
#Update
sudo yum check-update

pause

#Install Oracle Preinstall package
printf --  "\nRunning Oracle Preinstall Package\n"
sudo yum install -y oracle-database-preinstall-19c.x86_64
#Future Use/Testing for 64-bit
#sudo yum install -y oracle-database-preinstall-21c.x86_64

pause

printf --  "\nSetting SELinux to permissive\n"
#Set SELinux to Permissive
sudo setenforce Permissive
sudo systemctl stop firewalld
sudo systemctl disable firewalld

pause

printf --  "\nMaking a folder for dependencies\n"
#Make a folder for dependencies
mkdir ~/dependencies
cd ~/dependencies

printf --  "\nDownloading and installing Azul Java 11\n"
#Download and install java (be sure to check Azul for the latest 32-bit Java 11 for SWG and 64-bit for sqldeveloper)
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm -y
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm -y

pause

printf --  "\nInstalling additional dependencies for 32bit\n"
sudo yum install libXext.i686 libXrender.i686 libXtst.i686 -y

pause

printf --  "\nInstalling Python and Pip\n"
#Install Python (This command could vary by distro)
sudo yum install python39 -y
sudo yum install python39-pip -y
sudo yum install python39-ply -y

pause

printf --  "\nQue Set PATHs\n"
#Set Paths in Oracle bashrc
sudo sh /home/swg/swg-prepare/oracle_paths.sh

pause

#Download Oracle 19.3.0 Database
printf --  "\nQueing Oracle Database for download\n"
sh /home/swg/swg-prepare/oracle_downloads.sh

pause

#Make directories and extract
printf --  "\nQue Oracle DB Extract\n"
sudo sh /home/swg/swg-prepare/oracle_extract.sh

pause

#Move install scripts to Oracle User
printf --  "\nQue install scripts for transfer to Oracle user\n"
sudo sh /home/swg/swg-prepare/oracle_user.sh