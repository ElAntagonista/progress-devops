# Initial setup
* Enable pass auth on agent for first time setup

## Create a deployment user
* ./scripts/devops.sh
* run devops-user.yml

# Test if we have configured everything properly
ssh 172.28.128.15 -o PubkeyAuthentication=no

# Adhoc commands example
ansible agent -i hosts -m shell -a 'echo $TERM'
ansible agent -i hosts -m setup

# Playbook example
ansible-playbook -i hosts initial.yml -l webservers

## Creating new role - (easiest way)
`ansible-galaxy init <role>`

## Use check with ansible-playbook

## Execute playbooks Locally 

## Tags usage

## Blocks 

## Conditional execution of tasks/roles/blocks
<b>Notes</b>:

* group vars
* host vars

