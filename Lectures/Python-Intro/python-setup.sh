#! /usr/bin/env bash
sudo apt update && sudo apt install -y python3.8 python3-pip python3.8-venv
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 40
echo "alias python=python3" >> ~/.bashrc
echo "alias pip=pip3" >> ~/.bashrc
