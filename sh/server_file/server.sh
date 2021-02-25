#!/bin/bash

while true
do
  echo -e "HTTP/1.1 200 OK\n\n $2" | nc -l -p $1 -q 0
done
