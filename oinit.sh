#!/bin/bash

echo "Initializing Server and Checking for updates"
#Update
sudo yum check-update

echo "Making a folder for dependencies"
#Make a folder for dependencies
mkdir ~/dependencies
cd ~/dependencies

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

echo "Downloading and installing Azul Java 11"
#Download and install java (be sure to check Azul for the latest 32-bit Java 11)
wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm
sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.i686.rpm -y

#Future Use/Testing for 64-bit
#wget https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm
#sudo yum install ./zulu11.62.17-ca-jdk11.0.18-linux.x86_64.rpm -y

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
echo "Queing Oracle Database Utilities for download"
sh /home/swg/swg-prepare/oracle_downloads.sh

#Make directories and extract
echo "Que Oracle DB Extract"
sudo sh /home/swg/swg-prepare/oracle_extract.sh

#DEPRECATED STEPS
#These steps are now done by the oracle preinstall package, leaving it here anyways for reference or future needs

#echo "Setting up groups and oracle user"
#Setup groups and an oracle user
#groupadd oinstall
#groupadd dba
#groupadd oper
#groupadd nobody
#groupadd asmadmin
#useradd -g oinstall -G dba,asmadmin,oper -s /bin/bash -m oracle

#Edit Parameters
#echo '#### Oracle Kernel Parameters ####' | tee -a /etc/sysctl.conf
#echo 'fs.suid_dumpable = 1' | tee -a /etc/sysctl.conf
#echo 'fs.aio-max-nr = 1048576' | tee -a /etc/sysctl.conf
#echo 'fs.file-max = 6815744' | tee -a /etc/sysctl.conf
#echo 'kernel.shmall = 818227' | tee -a /etc/sysctl.conf
#echo 'kernel.shmmax = 4189323264' | tee -a /etc/sysctl.conf
#echo 'kernel.shmmni = 4096' | tee -a /etc/sysctl.conf
#echo 'kernel.panic_on_oops = 1' | tee -a /etc/sysctl.conf
#echo 'kernel.sem = 250 32000 100 128' | tee -a /etc/sysctl.conf
#echo 'net.ipv4.ip_local_port_range = 9000 65500' | sudo tee -a /etc/sysctl.conf
#echo 'net.core.rmem_default=262144' | tee -a /etc/sysctl.conf
#echo 'net.core.rmem_max=4194304' | tee -a /etc/sysctl.conf
#echo 'net.core.wmem_default=262144' | tee -a /etc/sysctl.conf
#echo 'net.core.wmem_max=1048576' | tee -a /etc/sysctl.conf

#echo '#### Oracle User Settings ####' | tee -a /etc/security/limits.conf
#echo 'oracle       soft  nproc  2047' | tee -a /etc/security/limits.conf
#echo 'oracle       hard  nproc  16384' | tee -a /etc/security/limits.conf
#echo 'oracle       soft  nofile 1024' | tee -a /etc/security/limits.conf
#echo 'oracle       hard  nofile 65536' | tee -a /etc/security/limits.conf
#echo 'oracle       soft  stack  10240' | tee -a /etc/security/limits.conf

#/sbin/sysctl -p

#Set symlinks
#ln -s /usr/lib/x86_64-linux-gnu /usr/lib64
#ln -s /lib/libgcc_s.so.1 /lib/libgcc_s.so
#ln -s /lib/x86_64-linux-gnu/libgcc_s.so.1 /lib64/libgcc_s.so.1
#ln -sf /bin/bash /bin/sh