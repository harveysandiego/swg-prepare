#!/bin/bash

#get some dependencies
yum install ant clang cmake libaio.i686 libgcc.i686 glibc.i686 glibc-devel.i686 libstdc++-devel.i686 ncurses-devel.i686 libxml2-devel libxml2-devel.i686 pcre-devel pcre-devel.i686 libcurl.i686 libcurl-devel libcurl-devel.i686 boost boost.i686 boost-devel boost-devel.i686 libnsl.i686 -y

#install oracle instantclients
rpm -Uhv  /home/swg/dependencies/oracle-instantclient-basic-19.17.0.0.0-1.i386.rpm
rpm -Uhv  /home/swg/dependencies/oracle-instantclient-devel-19.17.0.0.0-1.i386.rpm
rpm -Uhv  /home/swg/dependencies/oracle-instantclient-sqlplus-19.17.0.0.0-1.i386.rpm

#set env vars
touch /etc/ld.so.conf.d/oracle.conf
touch /etc/profile.d/oracle.sh
echo "/usr/lib/oracle/19.17/client/lib" | tee -a /etc/ld.so.conf.d/oracle.conf
echo "export ORACLE_HOME=/usr/lib/oracle/19.17/client" | tee -a /etc/profile.d/oracle.sh
echo "export PATH=$PATH:/usr/lib/oracle/19.17/client/bin" | tee -a /etc/profile.d/oracle.sh
echo "export LD_LIBRARY_PATH=/usr/lib/oracle/19.17/client/lib:/usr/include/oracle/19.17/client" | tee -a /etc/profile.d/oracle.sh
ln -s /usr/include/oracle/19.17/client $ORACLE_HOME/include
ldconfig
touch /etc/profile.d/java.sh
echo "export JAVA_HOME=/usr/lib/jvm/zulu-11-x86" | tee -a /etc/profile.d/java.sh