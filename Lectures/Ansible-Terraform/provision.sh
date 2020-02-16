#!/bin/bash
#pip3 install ansible
sudo apt-add-repository -y ppa:ansible/ansible && \
sudo apt update && \
sudo apt install -y ansible

sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
