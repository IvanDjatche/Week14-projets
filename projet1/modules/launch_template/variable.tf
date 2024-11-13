variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "launch_template_name" {
  type = string
}
variable "image_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "resource_type" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}