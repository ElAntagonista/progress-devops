
# Prerequisites
1. Your github repo where you'd commit your work
2. From the master branch create a branch called `DEVOPS-Ansible-intro`
3. Work in the newly created branch
4. When ready create a pull request and invite me as a reviewer
5. Please check the notes on the github setup [here](../../Bash-Intro/Homework/README.md)
6. Use the Vagrant setup 
7. If you'd like to work locally and not executing the ansible-playbook on a remote machine you could use this command:
    `ansible-playbook -i "localhost," <playbook_name> --connection=local`

Substitute playbook_name with the plabook yaml file for this task
----------
# Tasks

## Ansible playbook
Create a role and a subsequent playbook that utilizes that role which will 
install postgresql10 and has the capability of creating a database when a variable with the database name is present.

The role will be used on Ubuntu 18 but make sure you have the correct checks for the OS distribution.
 
