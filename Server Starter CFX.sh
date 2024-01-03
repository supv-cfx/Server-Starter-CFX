#!/bin/bash

# Save script directory
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

# Change this path !
CACHEPATH=$(dirname "$SCRIPT")"/cache/files"

# Store the server execution command
SERVER_EXEC="$SCRIPTPATH/alpine/opt/cfx-server/ld-musl-x86_64.so.1 \
    --library-path \"$SCRIPTPATH/alpine/usr/lib/v8/:$SCRIPTPATH/alpine/lib/:$SCRIPTPATH/alpine/usr/lib/\" -- \
    $SCRIPTPATH/alpine/opt/cfx-server/FXServer +set citizen_dir $SCRIPTPATH/alpine/opt/cfx-server/citizen/ \$*"

while true; do
    clear
    echo "+===============================================+"
    echo "| BASH SCRIPT - My Server CFX                   |"
    echo "+===============================================+"
    echo "|                                               |"
    echo "|  1) Start Server                              |"
    echo "|  2) Clear Cache - Start Server                |"
    echo "|  3) QUIT                                      |"
    echo "|                                               |"
    echo "+===============================================+"
    
    read -p "OPTION: " MENU_OPTION

    case $MENU_OPTION in
        1)
            eval "$SERVER_EXEC"
            ;;
        2)
            rm -rf "$PATH_CACHE"
            eval "$SERVER_EXEC"
            ;;
        3)
            INPUT=true
            echo "See you soon"
            sleep 2
            exit
            ;;
        *)
            echo "Option not available"
            sleep 2
            ;;
    esac
done
