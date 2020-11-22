provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/sgs/sgs.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "progres-infra"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config  = {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/vpc.state"
    region         = "us-east-1"
  }
}

resource "aws_security_group" "web" {
  name        = "Allow web"
  description = "Allow web inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id 

  ingress {
    description = "SSH from outside"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.bastion-ssh.id]
  }

  ingress {
    description = "HTTP from outside"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "bastion-ssh" {
  name        = "Allow SSH"
  description = "Allow SSH inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id 

  ingress {
    description = "SSH from outside"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}
