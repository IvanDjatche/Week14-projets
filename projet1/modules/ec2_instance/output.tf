# Output Instance IDs and Private IPs
output "app_1a_id" {
  value = aws_instance.utc-server-1a.id
}

output "app_1a_private_ip" {
  value = aws_instance.utc-server-1a.private_ip
}

output "app_1b_id" {
  value = aws_instance.utc-server-1b.id
}

output "app_1b_private_ip" {
  value = aws_instance.utc-server-1b.private_ip
}
output "ami_from_instance_id" {
  value = aws_ami_from_instance.utc_app_server_ami.id
}