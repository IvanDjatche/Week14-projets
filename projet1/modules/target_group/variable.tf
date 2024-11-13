variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "Name" {
  description = "Name of the target group"
  type = string
}
variable "target_type" {
  description = ""
  type = string
}
variable "port" {
  description = ""
  type = number
}
variable "protocol" {
  description = ""
  type = string
}
variable "vpc_id" {
  description = ""
  type = string
}
variable "protocol_version" {
  description = ""
  type = string
}
variable "path" {
  description = ""
  type = string
}
variable "Env" {
  description = ""
  type = string
}
variable "Team" {
  description = ""
  type = string
}

variable "instance1_target_id" {
  type = string
}
variable "instance2_target_id" {
  type = string
}