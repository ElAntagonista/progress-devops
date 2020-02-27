#!/bin/bash
sudo apt update
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant
sudo snap install microk8s --classic --channel=1.17/stable
microk8s.status --wait-ready
microk8s.enable dns
sudo usermod -a -G microk8s vagrant
echo "alias kubectl='microk8s.kubectl'" >> .profile
su - vagrant
