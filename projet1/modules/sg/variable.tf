variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "my_ip" {
  description = "Your public IP address for SSH access to the bastion host"
  type        = string
  default = "0.0.0.0/0"
}
variable "vpc_id" {
  description = "vpc for security group"
  type = string
}
variable "alb_name" {
  type = string
}
variable "bastian_name" {
  type = string
}
variable "app_name" {
  type = string
}
variable "database_name" {
  type = string
}
variable "efs_name" {
  type = string
}
variable "cidr_blocks" {
  description = "cidr bloks for any security groups"
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
