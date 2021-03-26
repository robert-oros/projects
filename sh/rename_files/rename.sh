#!/bin/bash


j=8
for i in {1..100};
do  
    j=$((j+1))
    file_name="file.txt" 

    
    if [ $i -le 9 ] || [ $j -le 9 ]; then
        echo "00$i $file_name | 00$j $file_name"
        # echo "j"
    #     `mv "00$i $file_name" "00$j $file_name"`
    #     echo "this file is renamed"
    elif [[ $j -le 99 ]]; then
        echo "0$i $file_name | 0$j $file_name"
        # `mv "0$i $file_name" "0$j $file_name"`
        # echo "this file is renamed"
    elif [[ $i -le 100 ]]; then
        echo "$i $file_name | $j $file_name"
        # `mv "$i $file_name" "$j $file_name"`
        #  echo "this file is renamed"     
    fi
done


# i=8
# for f in *.txt
# do 
#     i=$((i+1))
    
#     echo "$f $i" 
# done

# for f in *.mp4
# do 
#     echo $f
# done

# https://linuxhint.com/rename_file_bash/
# https://www.webservertalk.com/bash-increment-decrement-variable