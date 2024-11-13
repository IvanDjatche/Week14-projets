resource "aws_launch_template" "utc_launch_template" {
  name          = var.launch_template_name
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [var.security_group_id]  # Security group for app server

  tag_specifications {
    resource_type = var.resource_type
    tags = {
      Name = var.launch_template_name
      env  = var.Env
      team = var.Team
    }
  }
}
