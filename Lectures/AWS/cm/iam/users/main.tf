provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = "~> 0.12.20"

  backend "s3" {
    bucket         = "rf-test-prog"
    key            = "infra/terraform/us-east-1/iam.state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "rf-test-prog"
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
  name = "prog-users"
}

resource "aws_iam_group_membership" "team" {
  name = "prog-users-group-membership"

  users = [
    for v in aws_iam_user.this :
    v.name
  ]
  group = aws_iam_group.this.name
}


resource "aws_iam_group_policy" "this" {
  name  = "prog-users"
  group = aws_iam_group.this.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:DescribeInstances",
                "ec2:DescribeImages",
                "ec2:DescribeKeyPairs",
                "ec2:CreateKeyPair",
                "ec2:DescribeVpcs",
                "ec2:DescribeSubnets",
                "ec2:DescribeSecurityGroups",
                "ec2:CreateSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:us-east-1:706365375873:network-interface/*",
                "arn:aws:ec2:us-east-1:706365375873:volume/*",
                "arn:aws:ec2:us-east-1:706365375873:key-pair/*",
                "arn:aws:ec2:us-east-1:706365375873:security-group/*",
                "arn:aws:ec2:us-east-1:706365375873:subnet/subnet-1a2b3c4d"
            ]
        },
        {
            "Effect": "Allow",
            "Action": "ec2:RunInstances",
            "Resource": [
                "arn:aws:ec2:us-east-1:706365375873:instance/*"
            ],
            "Condition": {
                "StringEquals": {
                    "ec2:InstanceType": "t2.micro"
                }
            }
        }
    ]
}
EOF
}

