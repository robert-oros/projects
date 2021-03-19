#!/bin/bash

function usage() {
    echo "Usage: [-r <red>] or [-b <blue>]"
}

while getopts "hrb" option; do
case $option in
    h )
        echo "showing usage!"
        usage
    ;;
    r )
        echo "red"
    ;;
    b )
        echo "blue"
    ;;
    \? )
        echo "Unknow command: $@"
    ;;
    esac
done
 
