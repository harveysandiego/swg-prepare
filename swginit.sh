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
yum install ant clang bison flex cmake libaio.i686 libgcc.i686 glibc.i686 glibc-devel.i686 libstdc++-devel.i686 ncurses-devel.i686 libxml2-devel libxml2-devel.i686 pcre-devel pcre-devel.i686 libcurl.i686 libcurl-devel libcurl-devel.i686 boost boost.i686 boost-devel boost-devel.i686 sqlite-devel sqlite-devel.i686 libnsl.i686 -y
cd /home/swg/swg_dependencies
wget https://boostorg.jfrog.io/artifactory/main/release/1.81.0/source/boost_1_81_0.zip
unzip boost_1_81_0.zip 
cd /home/swg/swg_dependencies/boost_1_81_0/
sh /home/swg/swg_dependencies/boost_1_81_0/bootstrap.sh
./b2 install



#TODO: Rewrite those build scripts in Python3 as Python2 is Depracted
printf --  "\n\nInstalling Python2\n"
pause
#Install Python 2 to compile CRCs
yum install python2 -y
cp /usr/bin/python2 /usr/bin/python

#Install oracle instantclients
printf --  "\nInstalling Oracle Instant clients\n"
pause
cd /home/swg/swg_dependencies
rpm -Uhv /home/swg/swg_dependencies/oracle-instantclient18.3-basic-18.3.0.0.0-1.i386.rpm
rpm -Uhv /home/swg/swg_dependencies/oracle-instantclient18.3-devel-18.3.0.0.0-1.i386.rpm
rpm -Uhv /home/swg/swg_dependencies/oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.i386.rpm

#Install SQLDeveloper
printf --  "\nInstalling SQLDeveloper\n"
pause
cd /home/swg/swg_dependencies
rpm -Uhv /home/swg/swg_dependencies/sqldeveloper-22.2.1.234.1810.noarch.rpm
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