#!/bin/bash

#Move install scripts to Oracle User
echo "Transferring install scripts to Oracle user"
sudo mkdir /home/oracle/swg-prepare
sudo cp ~/swg-prepare/install_oracle_db.sh /home/oracle/swg-prepare
sudo cp ~/swg-prepare/create_oracle_db.sh /home/oracle/swg-prepare
sudo cp ~/swg-prepare/db_create.rsp /home/oracle/swg-prepare
sudo cp ~/swg-prepare/swgusr.sql /home/oracle/swg-prepare
sudo chown -R oracle /home/oracle/swg-prepare
sudo chmod -R 775 /home/oracle/swg-prepare