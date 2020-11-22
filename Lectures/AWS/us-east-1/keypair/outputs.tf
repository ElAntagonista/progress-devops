output "private_pem"{
  value = tls_private_key.this.private_key_pem
}

output "key_pair_arn"{
  value = aws_key_pair.this.arn
}

output "key_pair_id"{
  value = aws_key_pair.this.id
}

