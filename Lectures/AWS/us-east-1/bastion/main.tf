provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/bastion/bastion.state"
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

data "terraform_remote_state" "sgs" {
  backend = "s3"
  config  = {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/sgs/sgs.state"
    region         = "us-east-1"
  }
}

data "terraform_remote_state" "keypair" {
  backend = "s3"
  config  = {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/keypair/keypair.state"
    region         = "us-east-1"
  }
}


module "ec2_instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "bastion"
  instance_count         = 1
  associate_public_ip_address = true
  ami                    = var.image_id 
  instance_type          = "t2.micro"
  key_name               = data.terraform_remote_state.keypair.outputs.key_pair_id 
  monitoring             = true
  vpc_security_group_ids = [data.terraform_remote_state.sgs.outputs.sgs_ids["ssh"]]
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
 
  tags = {
    Terraform   = "true"
    Environment = "progress-production"
  }
}

