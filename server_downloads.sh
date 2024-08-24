#!/bin/bash

#Download Utilities for interacting with the Oracle Database
printf -- '\nDownloading Oracle Database Utilities\n'

#basic 18.3
wget https://www.swgevolve.com/oracle_deps/oracle-instantclient18.3-basic-18.3.0.0.0-1.i386.rpm
#devel 18.3
wget https://www.swgevolve.com/oracle_deps/oracle-instantclient18.3-devel-18.3.0.0.0-1.i386.rpm
#sqlplus 18.3
wget https://www.swgevolve.com/oracle_deps/oracle-instantclient18.3-sqlplus-18.3.0.0.0-1.i386.rpm
