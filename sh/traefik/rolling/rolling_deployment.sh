#!/bin/bash



switch(){
    while read line && read <&5 line2; do
        kill_server $line
        run_new_server $line2
    done <servers_pid.txt 5<ports.txt
    
    # while read line; do
    #     port=$line
    # done < ports.txt

    # while read line; do
    #     pid=$line

    #     kill_server $pid 
    #     run_new_server $port
    # done < servers_pid.txt
}


kill_server(){
    pid=$1

    echo "killl $pid"
    sudo kill -9 $pid
}

run_new_server(){
    port=$1

    echo "run $port"
    ./simple-server -p "$port" -n "new$port" & 
}

switch