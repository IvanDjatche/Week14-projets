# Output Security Group IDs
output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "bastion_host_sg_id" {
  value = aws_security_group.bastion_host_sg.id
}

output "app_server_sg_id" {
  value = aws_security_group.app_server_sg.id
}

output "database_sg_id" {
  value = aws_security_group.database_sg.id
}
output "efs_sg_id" {
  value = aws_security_group.efs_sg.id
}