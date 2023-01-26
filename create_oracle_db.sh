#!/bin/bash

#Pause function
function pause()
{
        printf -- "\n\n"
        read -s -n 1 -p "Press any button to continue setup or ctrl+c to quit..."
        printf -- "\n\n"
}

pause

printf -- '\n\nStart the Listener\n'
# Start the listener.
lsnrctl start

#Create DB
printf -- '\n\nCreate Datatbase in silent mode\n'
pause
# Silent mode.
dbca -silent -createDatabase -responseFile /home/oracle/swg-prepare/db_create.rsp                                                  