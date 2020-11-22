provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/autoscale/asg.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "progres-infra"
  }
}


locals {
  user_data = <<EOF
#!/bin/bash
apt update -y && apt install -y nginx
EOF
}


data "terraform_remote_state" "keypair" {
  backend = "s3"
  config  = {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/keypair/keypair.state"
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

data "terraform_remote_state" "vpc"{
  backend = "s3"
  config  = {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/vpc.state"
    region         = "us-east-1"
  }
}

data "aws_security_group" "default" {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  name   = "default"
}


module "progress-asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 3.0"
        
  name = "progress-asg"

  lc_name = "progress-lc"
  image_id        = var.image_id 
  instance_type   = "t2.micro"
  key_name = data.terraform_remote_state.keypair.outputs.key_pair_id 

  security_groups = [data.terraform_remote_state.sgs.outputs.sgs_ids["web"]]
  target_group_arns = module.alb.target_group_arns
        
  user_data_base64 = base64encode(local.user_data)

  ebs_block_device = [
    {
      device_name           = "/dev/xvdz"
      volume_type           = "gp2"
      volume_size           = "50"
      delete_on_termination = true
    },
  ]

  root_block_device = [
    {
      volume_size = "50"
      volume_type = "gp2"
    },
  ]

  # Auto scaling group
  asg_name                  = "progress-asg"
  vpc_zone_identifier       = data.terraform_remote_state.vpc.outputs.private_subnets
  health_check_type         = "EC2"
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  wait_for_capacity_timeout = 0

  tags = [
    {
      key                 = "Environment"
      value               = "progress-production"
      propagate_at_launch = true
    },
    {
      key                 = "Project"
      value               = "progress"
      propagate_at_launch = true
    },
  ]
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"

  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = data.terraform_remote_state.vpc.outputs.vpc_id  
  subnets            = data.terraform_remote_state.vpc.outputs.public_subnets 
  security_groups    = [data.aws_security_group.default.id]


  target_groups = [
    {
      name_prefix      = "prog"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
  }
}
