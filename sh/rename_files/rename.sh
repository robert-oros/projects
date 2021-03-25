#!/bin/bash

for i in {9..100};
do  
    count=$((i-1))

    if [[ $i -lt 10 ]]
    then 
        $(mv "00$i ana.mp4" "00$count ana.mp4")
        echo "this file is renamed"
    elif [[ $i -lt 99 ]]
    then
        $(mv "0$i ana.mp4" "0$count ana.mp4")
        echo "this file is renamed"
    fi
done


# for f in *.mp4
# do 
#     echo $f
# done

# https://linuxhint.com/rename_file_bash/
# https://www.webservertalk.com/bash-increment-decrement-variable