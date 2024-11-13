variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "iam_role_name" {
  type = string
}
variable "iam_role_service" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
variable "iam_policy_name" {
  type = string
}
variable "description" {
  default = "Policy to allow full access to S3 from EC2 instances"
  type = string
}
variable "aws_iam_instance_profile_name" {
  type = string
}