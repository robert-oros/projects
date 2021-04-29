#!/bin/bash

run_new_servers(){
    servers=$1
    port=$2

    echo "Last port started was $port"

    while ((i++ < servers)); do
		if [ "$i" -le "9" ]; then
            echo "808$i"
            #./simple-server -p 808"$i" -n "newserver$i" & 
		elif [ "$i" -le "99" ]; then
            echo "80$i"
            #./simple-server -p 80"$i" -n "newserver$i" & 
        else
            echo "8$i"
            #./simple-server -p 8"$i" -n "newserver$i" &   
		fi
	done
}


server_count=0
count_previous_ports(){ # the function counts how many servers were previously started
    file=$1

    while read line; do 
        server_count=$((server_count+1))
    done < $file
}

last_port=0
check_last_port(){ # the function is used to see from which port to start new servers
    file=$1

    while read line; do
        last_port=$line
    done < $file
}

kill_old_servers(){ # the function kills previously started servers after the process pid
    file=$1

    while read line; do 
        sudo kill -9 $line
    done < $file
}

count_previous_ports servers_pid.txt
check_last_port last_port.txt
run_new_servers $server_count $last_port
#kill_old_servers servers_pid.txt
