# Bastion Host Instance
resource "aws_instance" "bastion_host" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_public_ids_bastion
  key_name        = var.key_name
  security_groups = [var.bastian_security_group]

  tags = {
    Name = var.Name
    env  = var.Env
    team = var.Team
  }

  # User data to copy the key pair and set permissions
  user_data = file(var.installFileBostion)
}