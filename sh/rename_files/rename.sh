#!/bin/bash

# for i in {001..100};
# do  
#     dec=$((i-1))
#     # rename the file
#     $(mv "$i ana.mp4" "$dec ana.mp4")
#     echo "this file is renamed"
# done


for f in *.mp4
do 
    echo $f
done

# https://linuxhint.com/rename_file_bash/
# https://www.webservertalk.com/bash-increment-decrement-variable