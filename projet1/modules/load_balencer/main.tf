resource "aws_lb" "utc_alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.lb_security_group_ids]  # Replace with your ALB security group ID
  subnets            = [var.lb_public_subnet]  # Reference to public subnets from VPC module

  tags = {
    Name = var.lb_name
    env  = var.Env
    team = var.Team
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.utc_alb.arn
  port              = var.port
  protocol          = var.protocol
  default_action {
    type             = var.type
    target_group_arn = var.target_group_arn
  }
}
