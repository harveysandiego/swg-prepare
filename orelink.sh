#!/bin/bash

cd /u01/app/oracle/product/19.3.0/dbhome_1/lib/stubs
sudo rm libc.*
cd /u01/app/oracle/product/19.3.0/dbhome_1/bin
sudo ./relink all
cd