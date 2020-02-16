# Initial setup

sudo useradd -m -s /bin/bash devops
sudo passwd devops
sudo su
echo -e 'devops\tALL=(ALL)\tNOPASSWD:\tALL' > /etc/sudoers.d/devops
sudo su - devops
ssh-keygen -t rsa
export ANSIBLE_HOST_KEY_CHECKING=False

# test if we have configured everything properly
ssh 172.28.128.15 -o PubkeyAuthentication=no


# Adhoc commands
ansible node2 -i hosts -m shell -a 'echo $TERM' -u dev

# Playbooks
ansible-playbook -i hosts site.yml -l webservers

## Creating new role - (easiest way)
`ansible-galaxy init <role>`

