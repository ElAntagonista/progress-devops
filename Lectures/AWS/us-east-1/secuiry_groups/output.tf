output "sgs_ids" {
  value = {
    ssh = aws_security_group.bastion-ssh.id,
    web = aws_security_group.web.id
  }
}

