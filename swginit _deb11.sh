#!/bin/bash

#Pause function
function pause()
{
        printf -- "\n\n"
        read -s -n 1 -p "Press any button to continue setup or ctrl+c to quit..."
        printf -- "\n\n"
}

pause

#Install SWG Dependencies
printf --  "\nInstalling Dependencies for Compiling SWG\n"
apt-get install ant clang alien cmake libaio-dev libaio1 libboost-dev libboost-all-dev flex bison psmisc lib32z1 libc6-dbg libpcre3 libpcre3-dev libpcre32-3 libcurl4 libcurl4-gnutls-dev libxml2 libxml2-dev libxml2-utils libsqlite3-0 libsqlite3-dev -y

#TODO: Rewrite those build scripts in Python3 as Python2 is Depracted
printf --  "\n\nInstalling Python2\n"
pause
#Install Python 2 to compile CRCs
apt-get install python2 -y
cp /usr/bin/python2 /usr/bin/python

#Install oracle instantclients
printf --  "\nInstalling Oracle Instant clients\n"
pause
cd /home/swg/swg_dependencies
alien -i --target=amd64 /home/swg/swg_dependencies/oracle-instantclient18.3-basic-18.3.0.0.0-1.i386.rpm
alien -i --target=amd64 /home/swg/swg_dependencies/oracle-instantclient18.3-devel-18.3.0.0.0-1.i386.rpm
alien -i --target=amd64 /home/swg/swg_dependencies/oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.i386.rpm

#Install SQLDeveloper
printf --  "\nInstalling SQLDeveloper\n"
pause
cd /home/swg/swg_dependencies
alien -i --target=amd64 /home/swg/swg_dependencies/sqldeveloper-22.2.1.234.1810.noarch.rpm
#Set SQLDeveloper to use 64-bit java
printf --  "SetJavaHome  /usr/lib/jvm/zulu-11" | tee -a /opt/sqldeveloper/sqldeveloper/bin/sqldeveloper.conf

pause

#set env vars
printf --  "\nSetting Environment Variables\n"
touch /etc/ld.so.conf.d/oracle.conf
touch /etc/profile.d/oracle.sh
echo  "/usr/lib/oracle/18.3/client/lib" | tee -a /etc/ld.so.conf.d/oracle.conf
echo  "export ORACLE_HOME=/usr/lib/oracle/18.3/client" | tee -a /etc/profile.d/oracle.sh
echo  "export PATH=$PATH:/usr/lib/oracle/18.3/client/bin" | tee -a /etc/profile.d/oracle.sh
echo  "export LD_LIBRARY_PATH=/usr/lib/oracle/18.3/client/lib:/usr/include/oracle/18.3/client" | tee -a /etc/profile.d/oracle.sh
ln -sf /usr/include/oracle/18.3/client $ORACLE_HOME/include
ldconfig
touch /etc/profile.d/java.sh
echo  "export JAVA_HOME=/usr/lib/jvm/zulu-11-x86" | tee -a /etc/profile.d/java.sh