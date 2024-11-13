output "efs_id" {
  value = aws_efs_file_system.utc_efs.id
}
output "efs_arn" {
  value = aws_efs_file_system.utc_efs.arn
}
output "efs_owner_id" {
  value = aws_efs_file_system.utc_efs.owner_id
}