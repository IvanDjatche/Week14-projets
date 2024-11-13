variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "launch_template_id" {
  type = string
}
variable "private_subnet_id" {
  type = string
}
variable "desired_capacity" {
  type = number
}
variable "min_size" {
  type = number
}
variable "max_size" {
  type = number
}
variable "target_group_arn" {
  type = string
}
variable "health_check_type" {
  type = string
}
variable "health_check_grace_period" {
  type = number
}
variable "key" {
  type = string
}
variable "value" {
  type = string
}