#!/bin/bash


i=9-1
for f in *.txt; do 
    ((i++))
    
    new="file.txt" 
    
    if [[ $i -le 9 ]]; then # i <= 9: then put 00 before 
        mv "$f" " 00$i$new"
    elif [[ $i -le 99 ]]; then
        mv "$f" " 0$i$new"
    else
        mv "$f" " 0$i$new"
    fi
done

