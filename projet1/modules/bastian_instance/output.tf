# Output Bastion Host Public IP
output "bastion_host_id" {
  value = aws_instance.bastion_host.id
}
output "bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

