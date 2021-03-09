#!/bin/bash

declare arr

a="overloadramoverloadramoverloadramoverloadram"

for((i=1; i>0; i++)) do
  for((j=1; j>0; j++)) do
    arr[$i, $j]= $a$a
  done
done
