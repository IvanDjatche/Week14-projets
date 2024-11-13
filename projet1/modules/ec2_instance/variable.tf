variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "instance_type" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "key_name" {
  type = string
}
variable "app_security_group" {
  type = string
}
variable "private_subnet_ids_instance1" {
  type = string
}
variable "private_subnet_ids_instance2" {
  type = string
}
variable "iam_instance_profile" {
  type = string
}
variable "instalFile" {
  type = string
}
variable "Name" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
variable "ami_from_instance_name" {
  type = string
}