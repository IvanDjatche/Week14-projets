output "iam_role_name" {
  value = aws_iam_role.ec2_s3_access_role.name
}
output "iam_role_arn" {
  value = aws_iam_role.ec2_s3_access_role.arn
}
output "iam_policy_policy" {
  value = aws_iam_policy.s3_full_access_policy.policy
}
output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.ec2_s3_instance_profile.name
}