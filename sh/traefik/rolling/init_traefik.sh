#!/bin/bash

set -e

usage() {
	cat <<EOF
  Usage: [-s <services>]
  Description: This script creates as many servers
  as we want, specifyng the number. Using traefik 
  we will send traffinc to each server.
    -s, the number of services to start
EOF
}

services=0

while getopts "hs:" opt; do
	case $opt in
	h)
		usage
		;;
	s)
		services=$OPTARG
		;;
	\?)
		echo "Unknow command: $*"
		usage
		;;
	esac
done

set_ufw_rules() {
	sudo ufw enable
	sudo ufw allow 2222
	sudo ufw allow 22
	sudo ufw allow in on eth1 to any port 8088
}

download_traefik() {
	url='https://github.com/traefik/traefik/releases/download/v2.4.8/traefik_v2.4.8_linux_amd64.tar.gz'
	wget $url
	tar -zxvf traefik_v2.4.8_linux_amd64.tar.gz traefik
	rm -rf traefik_v2.4.8_linux_amd64.tar.gz
}

# The function generates code for the traefik_dynamic.toml configuration file.
generate_dynamic_toml() {
	while ((i++ < services)); do
		echo -e "\n\t[[http.services.app.weighted.services]]"
		echo -e "\t\tname = \"app$i"\"
		echo -e "\t\tweight = 1"
	done

	while ((j++ < services)); do
		echo -e "\n\t[http.services.app$j]"
		echo -e "\t\t[http.services.app$j.loadBalancer]"
		echo -e "\t\t\t[[http.services.app$j.loadBalancer.servers]]"
		echo -e "\t\t\t\turl = \"http://127.0.0.1:808$j/"\"
	done
}

# The function generates two files used to configure traefik.
generate_config_files() {
	cat >traefik.toml <<EOF
[entryPoints]
  [entryPoints.web]
  address = ":8088"
[api]
  insecure = true
  dashboard = true
  debug = true
[log]
  filePath = "$HOME/Desktop/traefik_log/traefik.log"
  format = "json"
  level = "DEBUG"
[providers]
  [providers.file]
    filename = "traefik_dynamic.toml"
[accessLog]
    filePath = "$HOME/Desktop/traefik_log/access-traefik.log"
    bufferingSize= 100
    format = "json"
EOF

	cat >traefik_dynamic.toml <<EOF
[http]
[http.routers]
  [http.routers.router0]
    entryPoints = ["web"]
    service = "app"
    rule = "Path(BACKTICK)" 
[http.services]
  [http.services.app]
    $(generate_dynamic_toml)
EOF

	sed -i "s|BACKTICK|\`/\`|g" traefik_dynamic.toml
}

run_servers() {
	chmod 764 simple-server


	while ((i++ < services)); do
		if [ "$i" -le "9" ]; then
			echo "808$i" >> ports.txt # rolling
			./simple-server -p "808$i" -n "server$i" & echo "$!" >> servers_pid.txt &
		elif [ "$i" -le "99" ]; then
			echo "80$i" >> ports.txt
			./simple-server -p "80$i" -n "server$i" & echo "$!" >> servers_pid.txt &
		elif [ "$i" -ge "100" ]; then
			echo "8$i" >> ports.txt
			./simple-server -p "8$i" -n "server$i" & echo "$!" >> servers_pid.txt &
		fi
	done
}


run_traefik() {
	./traefik --configFile=traefik.toml
}


if [ $services -ge 1 ]; then 
	#set_ufw_rules
	#download_traefik
	generate_config_files
	run_servers
	#run_traefik
fi

