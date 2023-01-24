#!/bin/bash

echo "Initializing Server and Checking for updates"
#Update
sudo yum check-update

#Install Oracle Preinstall package
echo "Running Oracle Preinstall Package"
sudo yum install -y oracle-database-preinstall-19c.x86_64
#Future Use/Testing for 64-bit
#sudo yum install -y oracle-database-preinstall-21c.x86_64

echo "Setting SELinux to permissive"
#Set SELinux to Permissive
sudo setenforce Permissive
sudo systemctl stop firewalld
sudo systemctl disable firewalld

echo "Making a folder for dependencies"
#Make a folder for dependencies
mkdir ~/dependencies
cd ~/dependencies

echo "Downloading and installing Azul Java 11"
#Download and install java (be sure to check Azul for the latest 32-bit Java 11 for SWG and 64-bit for sqldeveloper)
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm -y
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm -y

echo "Installing additional dependencies for 32bit"
sudo yum install libXext.i686 libXrender.i686 libXtst.i686 -y

echo "Installing Python and Pip"
#Install Python (This command could vary by distro)
sudo yum install python39 -y
sudo yum install python39-pip -y
sudo yum install python39-ply -y

echo "Que Set PATHs"
#Set Paths in Oracle bashrc
sudo sh /home/swg/swg-prepare/oracle_paths.sh

#Download Oracle 19.3.0 Database
echo "Queing Oracle Database for download"
sh /home/swg/swg-prepare/oracle_downloads.sh

#Make directories and extract
echo "Que Oracle DB Extract"
sudo sh /home/swg/swg-prepare/oracle_extract.sh

#Move install scripts to Oracle User
echo "Que install scripts for transfer to Oracle user"
sudo sh /home/swg/swg-prepare/oracle_user.sh