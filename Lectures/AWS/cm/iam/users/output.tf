output "user_info" {
  description = "The access key ID"
  value = [for v in aws_iam_user.this :
    ({
      username                = v.name
      access_key_id           = aws_iam_access_key.this[v.name].id
      secret_key_command      = <<EOF
      echo "${aws_iam_access_key.this[v.name].encrypted_secret}" | base64 --decode | keybase pgp decrypt
      EOF
      secret_password_command = <<EOF
      echo "${aws_iam_user_login_profile.this[v.name].encrypted_password}" | base64 --decode | keybase pgp decrypt
      EOF
    })
  ]
}



