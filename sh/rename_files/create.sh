#!/bin/bash


for i in {1..100}
do  
    f="$i file.txt"

    if [[ $i -le 9 ]]; then
        echo "$i" > "00$f"
    elif [[ $i -le 99 ]]; then
        echo "$i" > "0$f"
    else
        echo "$i" > "$f"
    fi
done
