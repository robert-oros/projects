#!/bin/bash

switch(){
    while read line; do
        kill_server $line
        run_new_server $line
    done <ports.txt
}

kill_server(){
    port=$1

    kill_server_by_port=`sudo kill -9 $(sudo lsof -t -i:$port)`
    $kill_procces_by_port
}

run_new_server(){
    port=$1
    ./simple-server -p "$port" -n "new$port" & 
}

switch