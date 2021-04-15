#!/bin/bash

check_if_exist(){
    tool=$1

    if [ $(command -v $tool) ]; then
        remove_utility $tool
        exit 1
    else
        dowload $tool
    fi
}

remove_utility(){
    rm_tool=$1
    
    if [ $(command -v $rm_tool) ]; then
        sudo apt-get remove $rm_tool || sudo rm -r /usr/bin/$rm_tool 
        dowload $rm_tool
    fi
}

# get_latest_release(){
    # https://github.com/USER/PROJECT/releases/latest/download/package.zip
# }

dowload(){
    dowload_tool=$1
    url='https://github.com/projectdiscovery/nuclei/releases/download/v2.3.4/nuclei_2.3.4_linux_amd64.tar.gz'

    cd /home/robert/Downloads/ 
    curl -sS $url # doesn't works 
    tar -zxvf nuclei_2.3.4_linux_amd64.tar.gz nuclei
    sudo mv nuclei /usr/bin/
}


check_if_exist nuclei