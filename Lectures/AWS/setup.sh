#! /usr/bin/env bash
sudo apt update && sudo apt install -y python3.8 python3-pip awscli
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 40
echo "alias python=python3" >> ~/.bashrc
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
