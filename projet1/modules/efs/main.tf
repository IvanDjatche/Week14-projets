## create EFS file system
resource "aws_efs_file_system" "utc_efs" {
  creation_token = var.creation_token
  
  tags = {
    Name = var.efs_name
    env  = var.Env
    team = var.Team
  }
}
## Create EFS Mount Targets in Each Availability Zone
resource "aws_efs_mount_target" "utc_efs_mount_target_1a" {
  file_system_id = aws_efs_file_system.utc_efs.id
  subnet_id      = var.private_subnets1  # Replace with the subnet ID for AZ 1a
  security_groups = [var.efs_sg_id]  # Security group allowing access from app servers
}

resource "aws_efs_mount_target" "utc_efs_mount_target_1b" {
  file_system_id = aws_efs_file_system.utc_efs.id
  subnet_id      = var.private_subnets2  # Replace with the subnet ID for AZ 1b
  security_groups = [var.efs_sg_id]
}

