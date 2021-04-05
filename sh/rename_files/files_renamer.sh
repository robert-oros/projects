#!/bin/bash



i=8
for f in *.txt; do 
    ((i++))
    
    new="$i file.txt" 
    
    if [[ $i -le 9 ]]; then 
        mv "$f" "00$new"
    elif [[ $i -le 99 ]]; then
        mv "$f" "0$new"
    else
        mv "$f" "0$new"
    fi
done

