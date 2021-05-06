#!/bin/bash

run_new_servers(){
    count=$1
    port=$2

    echo "Last port started was $port"

    while ((i++ < count)); do
        port=$((port+1))

        echo $port
        ./simple-server -p "$port" -n "new$port" & 
	done
}


server_count=0
count_previous_ports(){ # the function counts how many servers were previously started
    file=$1

    while read line; do 
        server_count=$((server_count+1))
    done < $file
}

last_port=0 
check_last_port(){ # the function is used to see from which port to start new servers
    file=$1

    while read line; do
        last_port=$line
    done < $file
}

generate_toml() { 
    count=$1
    port=$2

	while ((j++ < count)); do
        port=$((port+1))

		echo -e "\n\t[[http.services.app.weighted.services]]"
		echo -e "\t\tname = \"app$j"\"
		echo -e "\t\tweight = 1"
	done

    while ((k++ < count)); do
        port=$((port+1))

        echo -e "\n\t[http.services.app$k]"
        echo -e "\t\t[http.services.app$k.loadBalancer]"
        echo -e "\t\t\t[[http.services.app$k.loadBalancer.servers]]"
        echo -e "\t\t\t\turl = \"http://127.0.0.1:$port/"\"
	done
}

replace_old_toml(){
    file=$1

    cat >$file <<EOF
[http]
[http.routers]
  [http.routers.router0]
    entryPoints = ["web"]
    service = "app"
    rule = "Path(BACKTICK)" 
[http.services]
  [http.services.app]
    $(generate_toml $server_count $last_port)
EOF

	sed -i "s|BACKTICK|\`/\`|g" $file
    
}

kill_old_servers(){ # the function kills previously started servers after the process pid
    file=$1

    while read line; do 
        sudo kill -9 $line
    done < $file

    rm -rf last_port.txt servers_pid.txt
}


count_previous_ports servers_pid.txt
check_last_port last_port.txt
run_new_servers $server_count $last_port
replace_old_toml traefik_dynamic.toml
kill_old_servers servers_pid.txt
