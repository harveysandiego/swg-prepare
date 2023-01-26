#!/bin/bash

#Pause function
function pause()
{
        printf -- "\n\n"
        read -s -n 1 -p "Press any button to continue setup or ctrl+c to quit..."
        printf -- "\n\n"
}

printf --  "\n####################\n\nWelcome to the SWG Server Preparation Script!\nThis script is designed primarily for Oracle Linux 8.\nThis may not work on distros without those available packages.\n\n!!!This is the Multi Server Installation and will ONLY install the Database on Oracle Linux 8!!!\n\n\n####################\n"

pause

#Que up initialization script
printf -- "\nQue Up Initialization Script\n"
sh /home/swg/swg-prepare/oinit.sh

pause

#Que up Oracle Installers
printf -- "\nQue Up Oracle Installation Scripts\n"
sh /home/swg/swg-prepare/oracle_installer.sh

#Create Oracle Service
printf -- "\n\nCreate Oracle Service to start and stop the DB\n"
pause
sudo sh /home/swg/swg-prepare/oservice.sh

pause
#Thank you
printf -- "\n\n\nThank you for using my script! You have now completed the database installation and creation procedures. Please run the second script multi_server_install_gameserver.sh on another server.\n\n"