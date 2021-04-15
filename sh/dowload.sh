#!/bin/bash

check_if_exit(){
    tool=$1

    if [ $(command -v $tool) ]; then
        echo "exist"
        remove_tool $tool
        exit 1
    else
        dowload $tool
    fi
}

remove_tool(){
    rm_tool=$1
    
    if [ $(command -v $rm_tool) ]; then
        echo "exist"
        sudo apt-get remove $rm_tool
         
        dowload $rm_tool
    fi
}

dowload(){
    dowload_tool=$1

    sudo apt-get install $dowload_tool
    # mkdir /tmp/tmp_dir
    # cd /tmp/tmp_dir
    # curl -sS https://github.com/mirror/wget/archive/refs/tags/v1.21.1.zip > file.zip
    # unzip file.zip -d /home/robert/Desktop/
}


check_if_exit wget 