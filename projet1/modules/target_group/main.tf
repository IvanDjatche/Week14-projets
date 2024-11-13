resource "aws_lb_target_group" "utc_target_group" {
  name               = var.Name
  target_type        = var.target_type
  port               = var.port
  protocol           = var.protocol
  vpc_id             = var.vpc_id
  protocol_version   = var.protocol_version

  health_check {
    protocol = var.protocol
    path     = var.path
  }

  tags = {
    env  = var.Env
    team = var.Team
  }
}

resource "aws_lb_target_group_attachment" "utc_appserver_1a" {
  target_group_arn = aws_lb_target_group.utc_target_group.arn
  target_id        = var.instance1_target_id
  port             = var.port
}

resource "aws_lb_target_group_attachment" "utc_appserver_1b" {
  target_group_arn = aws_lb_target_group.utc_target_group.arn
  target_id        = var.instance2_target_id
  port             = var.port
}
