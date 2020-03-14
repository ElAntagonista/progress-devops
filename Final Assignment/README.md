# progress-assignment
[Github repo for the task](https://github.com/ElAntagonista/progress-assignment)

## Overview
This is a team assignemnt. You'd need to collaborate on the task in order to complete it.
You can use Discord or any other communication tool.

# Prerequisites

## Development environment
As you'd need to work with ssh, consider using the Vagrant file included in the folder.
It's stripped of any preconfigurations(no terraform, ansible installed) but as part of the assignment
you'd need to set it up as per your needs.

## Git
The master branch has been locked for push without a pull request.
Your workflow in git should be:
1) Clone this repo locally
2) Create a new feature branch from master
3) Push the feature branch to Github
4) Work exclusively in this feature branch until you are ready
5) When ready create a pull request


# Task
1) Write a setup bash script for your Vagrant boxes(**optional**)
    - it should install python3 and pip3
    - it should install aws cli
    - it should install ansible and terraform

2) Create a Ubuntu 18.04 EC2 instance in AWS using Terraform.
   - there's a scafold *main.tf* in the terraform directory, do not change it's contents just continue with the configuration.
   - use the AWS credentials provided to you
        - use `aws configure` to setup your programatic credentials
   - for the ssh key name use -- `jumpy`
        - the key could be found in **Discord** - *aws* chanel
   - deploy the EC2 inside the **default** VPC
     - **instance_type is restricted to _t2.micro_**
   - assign the EC2 a public ip address
   - make sure only port 22 and 80 are opened (use security groups)
   - DO NOT CONFIGURE STORAGE related settings
   - the terraform configuration should have an *output* variable that will help me see the public endpoint of the EC2

   
2) Write an ansible playbook that will deploy the python web application in this repository
   The playbook should make sure the following things are done:
   - make sure Docker has been installed and you have access to the docker cli
   - make sure python dependencies for this two modules: [docker_image](https://docs.ansible.com/ansible/latest/modules/docker_image_module.html),[docker_container](https://docs.ansible.com/ansible/latest/modules/docker_container_module.html#docker-container-module) are present on the system
   - copy application source to the EC2
   - build the docker image for this app using it's Dockerfile (!!!use *docker_image* module)
   - run the container from this image (!!! use *docker_container* module)

*The task will be considered completed when I run your terraform code and playbook, go to the public ip of the EC2 and see the index.html being servered*