#!/bin/bash
sudo apt-add-repository -y ppa:ansible/ansible && \
sudo apt update && \
sudo apt install -y ansible
echo "export ANSIBLE_HOST_KEY_CHECKING=False" >> ~/.bashrc
sudo bash -c "$(echo "172.28.128.15 agent" >> /etc/hosts)"
