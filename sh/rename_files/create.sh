#!/bin/bash


for i in {1..100}
do  
    file_name="$i file.txt"

    if [[ $i -le 9 ]]
    then
        echo "$i" > "00$file_name"
    elif [[ $i -le 99 ]]
    then
        echo "$i" > "0$file_name"
    else
        echo "$i" > "$file_name"
    fi
done
