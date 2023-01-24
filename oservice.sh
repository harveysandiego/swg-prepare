#!/bin/bash

cp /home/swg/swg-prepare/includes/odb/odb.service /etc/systemd/system/
cp /home/swg/swg-prepare/includes/odb/odb-start.sh /etc/
cp /home/swg/swg-prepare/includes/odb/odb-stop.sh /etc/
systemctl enable odb.service
