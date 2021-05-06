#!/bin/bash

# run_new_server(){
    
# }

kill_server(){
    file=$1

    while read line; do 
        sudo kill -9 $line
    done < $file
}

# count=0
# count_servers(){ # the function counts how many servers were previously started
#     while read line; do
#         count=$((count+1))
#         echo $count
#     done < servers_pid.txt
# }

# count_servers