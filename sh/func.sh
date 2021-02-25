#!/bin/bash

first_f() {
   v="test"
   echo "first: $v" 
}

second_f() {
   echo "second: $v"
   v="newvalue"
}

first_f
second_f
echo $v
