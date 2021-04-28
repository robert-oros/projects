#!/bin/bash

run_new_servers(){
    servers=$1

    while ((i++ < servers)); do
        echo $i
		if [ "808$i" -le "8099" ]; then
            ./simple-server -p 808"$i" -n "newserver$i" & 
		elif [ "808$i" -le "8099" ]; then
			./simple-server -p 80"$i" -n "newserver$i" & 
		fi
	done
}

# modify_config(){

# }

server_count=0

kill_old_servers(){
    while read line; do 
        server_count=$((server_count+1))
        sudo kill -9 $line
    done < servers_pid
}

kill_old_servers
run_new_servers $server_count