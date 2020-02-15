#!/bin/bash
sudo apt update && sudo apt install -y python3.7 python3-pip python3.7-venv
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
echo "alias python=python3" >> ~/.bashrc
