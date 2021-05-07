#!/bin/bash

# kill_server(){

#     while read line; do
#         if [[ $line -eq 0 ]]; then
#             break
#         else
#             echo "kill server $line"
#             run_new_server
#         fi
#     done < servers_pid.txt
# }

# run_new_server(){
#     while read line; do
#         if [[ $line -eq 0 ]]; then
#             break
#         else
#             echo "run server $line"
#             kill_server
#         fi
#     done < ports.txt

# }


# main(){
#     t=0
#     echo $t

#     while [ $t -le 3 ]
#     do
#         t=$((t+1))
        
#         if [[ $t -eq 3 ]]; then
#             break
#         else
#             kill_server
#         fi
#     done
# }

# main
count=0
count_servers(){
    while read line; do
        count=$((count+1))
    done < ports.txt
}


kill_server(){
    c=0
    while read line; do
        c=$((c+1))
        
        if [[ $c -lt $count ]]; then
            echo "kill $line"
            run_new_server $c
        elif [[ $c -eq $count ]]; then
            echo "STOOP"
            break
        fi
    done < servers_pid.txt
}

run_new_server(){
    c=$1

    while read line; do 
        c=$((c+1))
        if [[ $c -lt $count ]]; then
            echo "run $line"
            kill_server
        elif [[ $c -eq $count ]]; then
            echo "STOOP"
            break
        fi 
    done < ports.txt
    # if [[ $c -lt $count ]]; then
    #     echo "run $c"
    #     kill_server
    # elif [[ $c -eq $count ]]; then
    #     echo "STOOP"
    #     break
    # fi 


}




count_servers
kill_server 



