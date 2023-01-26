#!/bin/bash

#Menu
function menu() {
    local prompt="$1" outvar="$2"
    shift
    shift
    local options=("$@") cur=0 count=${#options[@]} index=0
    local esc=$(echo -en "\e") # cache ESC as test doesn't allow esc codes
    printf "$prompt\n"
    while true
    do
        # list all options (option list is zero-based)
        index=0 
        for o in "${options[@]}"
        do
            if [ "$index" == "$cur" ]
            then echo -e " >\e[7m$o\e[0m" # mark & highlight the current option
            else echo "  $o"
            fi
            index=$(( $index + 1 ))
        done
        read -s -n3 key # wait for user to key in arrows or ENTER
        if [[ $key == $esc[A ]] # up arrow
        then cur=$(( $cur - 1 ))
            [ "$cur" -lt 0 ] && cur=0
        elif [[ $key == $esc[B ]] # down arrow
        then cur=$(( $cur + 1 ))
            [ "$cur" -ge $count ] && cur=$(( $count - 1 ))
        elif [[ $key == "" ]] # nothing, i.e the read delimiter - ENTER
        then break
        fi
        echo -en "\e[${count}A" # go up to the beginning to re-render
    done
    # export the selection to the requested output variable
    printf -v $outvar "${options[$cur]}"
}

#Define Options
selections=(
"Single Server Install"
"Multi Server Install - Database"
"Multi Server Install - Gameserver (Oracle 8)"
"Multi Server Install - Gameserver (Debian 11)"
)

#Welcome Message
printf --  "\n####################\n\nWelcome to the SWG Server Preparation Script!\n\n####################\n\n\n\nPlease choose your options carefully and refer to the guide of GitHub.\n\n\n\n"

#Call Menu
menu "Choose Installation Option:" selected_choice "${selections[@]}"

#Process Selection
echo "Selected choice: $selected_choice"

if [ "$selected_choice" = "Single Server Install" ];
then
        ~/swg-prepare/single_server_install.sh

elif [ "$selected_choice" = "Multi Server Install - Database" ];
then
        ~/swg-prepare/multi_server_install_dbserver.sh

elif [ "$selected_choice" = "Multi Server Install - Gameserver (Oracle 8)" ];
then
        ~/swg-prepare/multi_server_install_gameserver.sh

elif [ "$selected_choice" = "Multi Server Install - Gameserver (Debian 11)" ];
then
        ~/swg-prepare/multi_server_install_gameserver_deb11.sh
fi