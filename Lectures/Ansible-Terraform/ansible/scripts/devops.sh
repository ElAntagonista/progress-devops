#!/usr/bin/env bash
useradd -m -s /bin/bash devops
echo "devops:password123" | chpasswd
echo -e 'devops\tALL=(ALL)\tNOPASSWD:\tALL' > /etc/sudoers.d/devops
cmd="$(mkdir -p /home/devops/.ssh &&\
ssh-keygen -t rsa -f /home/devops/.ssh/id_rsa -q -P "" &&\
chown devops:devops -R /home/devops/.ssh &&\
export ANSIBLE_HOST_KEY_CHECKING=False)" 
su - devops -c "$cmd" 
