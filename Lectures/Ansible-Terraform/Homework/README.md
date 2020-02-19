
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

Using the script from the python homework you'd need to write an ansible playbook that would execute it on a remote machine.
There's no need to create a role for this task as it's fairly simple.
The script should do the following:
1. Verify that python3 and pip3 are installed
2. Install psutil python package on the system
3. Run the script with a variable for process name set in the playbook
4. If there are no errors display the output of it

**Hints**
- use the pip module to install the _psutil_ package
    - use python3 as an executable
- use the script module to run the script(read about *register* in Ansible to get the output of the script)
- use debug module to display the output

