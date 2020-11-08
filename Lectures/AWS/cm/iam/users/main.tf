provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "progres-infra"
    key            = "terraform/us-east-1/iam/users.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "progres-infra"
  }
}

resource "aws_iam_user" "this" {
  for_each      = toset(var.names)
  name          = each.value
  path          = var.path
  force_destroy = var.force_destroy
  tags          = var.tags
}

resource "aws_iam_user_login_profile" "this" {
  for_each                = toset([for v in aws_iam_user.this : v.name])
  user                    = each.value
  pgp_key                 = var.pgp_key
  password_length         = var.password_length
  password_reset_required = var.password_reset_required
}

resource "aws_iam_access_key" "this" {
  for_each = toset([for v in aws_iam_user.this : v.name])
  user     = each.value
  pgp_key  = var.pgp_key
}

resource "aws_iam_group" "this" {
  name = "progress-admins"
}

resource "aws_iam_group_membership" "team" {
  name = "prog-users-group-membership"

  users = [
    for v in aws_iam_user.this :
    v.name
  ]
  group = aws_iam_group.this.name
}


data "template_file" "this" {
  template = file("admins.json.tpl")

  vars = {
    account_id = var.account_id
  }
}

resource "aws_iam_group_policy" "this" {
  name  = "progress-admins"
  group = aws_iam_group.this.id

  policy = data.template_file.this.rendered
}

