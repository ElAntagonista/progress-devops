provider "github" {
  organization = "progress-github"
  token        = var.token
}

resource "github_repository" "repo" {
  name        = "terraform-test"
  description = "A terraform test"
  private     = false
}
