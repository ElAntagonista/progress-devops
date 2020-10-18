#!/bin/bash
sudo apt update
curl -sSL https://get.docker.com/ | sh
sudo usermod -aG docker vagrant