provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "rf-test-prog"
    key            = "infra/terraform/us-east-1/vpc.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rf-test-prog"
  }
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc.vpc_id
}

module "vpc" {
  source = "git@github.com:terraform-aws-modules/terraform-aws-vpc.git"

  name = "prog-vpc"

  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_ipv6 = false

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    Name = "prog-public"
  }

  tags = {
    Environment = "prog"
  }

  vpc_tags = {
    Name = "prog-vpc"
  }
}
