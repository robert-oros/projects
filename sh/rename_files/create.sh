#!/bin/bash

for i in {009..100}
do
    # if [[ $i -le 9 ]]
    # then
    #     touch "00$i ana.mp4"
    # elif [[ $i -le 99 ]]
    # then
    #     touch "0$i ana.mp4"
    # else
        touch "$i ana.mp4"
done
