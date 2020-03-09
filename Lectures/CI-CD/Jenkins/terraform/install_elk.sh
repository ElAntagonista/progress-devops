#!/bin/bash

#ONE LINE
#sudo wget -Nnv 'https://gist.githubusercontent.com/kydouglas/1f68d69e856fd6d7dc223f8e1f5ae3b3/raw/f8c3b22b9d9c41093150b96c815776956b523d9d/elk.sh' && bash elk.sh && rm -f elk.sh

# Checking whether user has enough permission to run this script
sudo -n true
if [ $? -ne 0 ]
    then
        echo "This script requires user to have passwordless sudo access"
        exit
fi

dependency_check_deb() {
sudo apt-get update
java -version
if [ $? -ne 0 ]
    then
        
        # Installing Java 8 if it's not installed
        sudo apt-get install openjdk-8-jre-headless -y
    # Checking if java installed is less than version 7. If yes, installing Java 7. As logstash & Elasticsearch require Java 7 or later.
    elif [ "`java -version 2> /tmp/version && awk '/version/ { gsub(/"/, "", $NF); print ( $NF < 1.8 ) ? "YES" : "NO" }' /tmp/version`" == "YES" ]
        then
            sudo apt-get install openjdk-8-jre-headless -y
fi

}

debian_elk() {
    # resynchronize the package index files from their sources.
    sudo apt-get update
    sudo apt-get install apt-transport-https
    wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - 
    echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
  
    sudo apt-get update && sudo apt-get install elasticsearch=7.5.0 -y \
    && sudo apt-get install logstash -y \
    && sudo apt-get install kibana=7.5.0 -y

    # Starting The Services
    sudo systemctl restart logstash
    sudo systemctl enable logstash
    sudo systemctl restart elasticsearch
    sudo systemctl enable elasticsearch
    sudo systemctl restart kibana
    sudo systemctl enable kibana

    # Installing nginx and apache utils
    sudo apt-get install nginx -y
    sudo apt-get install apache2-utils -y
}

# Installing ELK Stack
dependency_check_deb
debian_elk

# Kibana
# kibana@1234
