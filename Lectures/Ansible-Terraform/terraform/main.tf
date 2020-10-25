# A very basic example of using Terraform
# Here we use the github provider to create 
# a github repository in a given github organization

provider "github" {
  owner = var.github_organization
  token        = var.token
}

resource "github_repository" "repo" {
  name        = "terraform-testy"
  description = "A terraform test"
  private     = false
}
