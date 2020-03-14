variable "names" {
  description = "Desired name for the IAM user"
  type        = list(string)
}

variable "path" {
  description = "Desired path for the IAM user"
  type        = string
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  type        = bool
  default     = false
}

variable "pgp_key" {
  description = "Either a base-64 encoded PGP public key, or a keybase username in the form keybase:username. Used to encrypt password and access key."
  type        = string
  default     = "keybase:krismembegmailco"
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on first login."
  type        = bool
  default     = false
}

variable "password_length" {
  description = "The length of the generated password"
  type        = number
  default     = 20
}

variable "permissions_boundary" {
  description = "The ARN of the policy that is used to set the permissions boundary for the user."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default = {
    environment = "prog"
  }
}

variable "account_id" {
}
