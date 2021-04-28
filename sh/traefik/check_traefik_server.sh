#!/bin/bash

set -e

usage() {
	cat <<EOF
  Usage: [-c <count>]
  Description: The script checks if a server's 
  status line is 200.
    -c, how many times to check the server
EOF
}

count=0

while getopts "hc:" opt; do
	case $opt in
	h)
		usage
		;;
	c)
		count=$OPTARG
		;;
	\?)
		echo "Unknow command: $*"
		usage
		;;
	esac
done

check_server() {
	while ((i++ < count)); do
		get_status_code=$(curl -s -S -o /dev/null -I -w localhost:8088)

		echo $get_status_code
		# if [ "$get_status_code" = "200" ]; then
		# 	echo "$get_status_code"
		# else
		# 	echo "Something went wrong: $get_status_code"
		# fi
		# sleep 1
	done
}

check_server
