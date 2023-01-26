#!/bin/bash

#Download Oracle 19.3.0 Database
echo 'Downloading Oracle Database Utilities'
pip3 install gdown --user

#Oracle 19c Preinstall Pack
cd ~/ora_dependencies
gdown https://drive.google.com/uc?id=1Z-iOThbbSenPdZF1ohr-TCe17qNgVEPe

#Oracle 19c
cd ~/ora_dependencies
gdown https://drive.google.com/uc?id=10jaeSCM4lZt6ZikmabiI7JjNFVSPz4jv

#Future Use/Testing for 64-bit
#Oracle 21c
#gdown https://drive.google.com/uc?id=1eSgTaqW-YPhyKqmF9yBLwEnvXktZ867s
