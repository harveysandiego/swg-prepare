#!/bin/bash

echo "Set PATHs"
#Set Paths in Oracle bashrc
echo '# Oracle Settings' | tee -a /home/oracle/.bashrc
echo 'export TMP=/tmp;' | tee -a /home/oracle/.bashrc
echo 'export TMPDIR=$TMP;' | tee -a /home/oracle/.bashrc
echo 'export ORACLE_HOSTNAME=swg;' | tee -a /home/oracle/.bashrc
echo 'export ORACLE_BASE=/u01/app/oracle;' | tee -a /home/oracle/.bashrc
echo 'export ORACLE_HOME=$ORACLE_BASE/product/19.3.0/dbhome_1;' | tee -a /home/oracle/.bashrc
echo 'export ORA_INVENTORY=/u01/app/oraInventory;' | tee -a /home/oracle/.bashrc
echo 'export ORACLE_SID=swg;' | tee -a /home/oracle/.bashrc
echo 'export ORACLE_UNQNAME=$ORACLE_SID;' | tee -a /home/oracle/.bashrc
echo 'export PATH=/usr/sbin:$ORACLE_HOME/bin:$PATH;' | tee -a /home/oracle/.bashrc
echo 'export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib:/usr/lib64;' | tee -a /home/oracle/.bashrc
echo 'export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib;' | tee -a /home/oracle/.bashrc