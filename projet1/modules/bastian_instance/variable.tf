variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "instance_type" {
  type = string
}
variable "key_name" {
  type = string
}
variable "bastian_security_group" {
  type = string
}
variable "ami_id" {
  type = string
}
variable "subnet_public_ids_bastion" {
  type = string
}
variable "installFileBostion" {
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