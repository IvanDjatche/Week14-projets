output "autoscale_id" {
  value = aws_autoscaling_group.utc_asg.id
}
output "autoscale_arn" {
  value = aws_autoscaling_group.utc_asg.arn
}
output "autoscale_tag" {
  value = aws_autoscaling_group.utc_asg.tag
}