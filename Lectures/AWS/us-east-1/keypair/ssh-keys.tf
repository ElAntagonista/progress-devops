provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/keypair/keypair.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "progres-infra"
  }
}


resource "tls_private_key" "this" {
  algorithm = "RSA"
} 


resource "aws_key_pair" "this" {
  key_name   = var.ssh_key_pair_name 
  public_key = tls_private_key.this.public_key_openssh
}
