#!/bin/bash

sudo cp ~/swg-prepare/includes/odb/odb.service /etc/systemd/system/
sudo cp ~/swg-prepare/includes/odb/odb-start.sh /etc/
sudo cp ~/swg-prepare/includes/odb/odb-stop.sh /etc/
sudo systemctl enable odb.service
