#!/bin/bash

#Move install scripts to Oracle User
echo "Transferring install scripts to Oracle user"
mkdir /home/oracle/swg-prepare
cp /home/swg/swg-prepare/install_oracle_db.sh /home/oracle/swg-prepare
cp /home/swg/swg-prepare/create_oracle_db.sh /home/oracle/swg-prepare
chown -R oracle /home/oracle/swg-prepare
chmod -R 775 /home/oracle/swg-prepare