#!/bin/bash

#Download Oracle 19.3.0 Database
echo 'Downloading Oracle Database Utilities'

#Oracle 19c Preinstall Pack
cd ~/ora_dependencies
wget https://www.swgevolve.com/oracle_deps/oracle-database-preinstall-19c-1.0-2.el8.x86_64.rpm

#Oracle 19c
cd ~/ora_dependencies
wget https://www.swgevolve.com/oracle_deps/LINUX.X64_193000_db_home.zip
