#!/bin/bash
sudo snap install microk8s --classic
microk8s status --wait-ready
microk8s enable dashboard dns
echo "alias ktl='microk8s kubectl'"
