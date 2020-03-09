variable "github_token" {
  description = "The GitHub Token to be used for the CodePipeline"
  type        = "string"
  default     = "a691a0d075894930be94d602485778692ebda8be"
}

variable "region" {
  description = "region to deploy to"
  type        = "string"
  default     = "us-east-1"
}

variable "github-repo" {
  default = "green-blue-ecs-example"
}

variable "github-owner" {
  default = "ElAntagonista"
}

provider "aws" {
  region = "${var.region}"
  #version = "2.7"
}

