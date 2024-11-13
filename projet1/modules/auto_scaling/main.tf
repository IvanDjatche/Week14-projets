# creating auto scaling
resource "aws_autoscaling_group" "utc_asg" {
  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  vpc_zone_identifier = [var.private_subnet_id]  # Subnets in your VPC
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size

  target_group_arns = [var.target_group_arn]  # Link to target group

  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  tag {
    key                 = var.key
    value               = var.value
    propagate_at_launch = true
  }
}

# Configure Dynamic Scaling Based on CPU Utilization
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name                = "utc-cpu-high"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 80

  alarm_description         = "Alarm when CPU exceeds 80%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.utc_asg.name
  }

  alarm_actions             = [aws_autoscaling_policy.scale_out_policy.arn]
}
resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name                = "utc-cpu-low"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 30

  alarm_description         = "Alarm when CPU drops below 30%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.utc_asg.name
  }

  alarm_actions             = [aws_autoscaling_policy.scale_in_policy.arn]
}
# Create Scaling Policies
resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.utc_asg.name
}

resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.utc_asg.name
}
