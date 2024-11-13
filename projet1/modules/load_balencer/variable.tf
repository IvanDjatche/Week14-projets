variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "lb_name" {
  type = string
}
variable "lb_type" {
  type = string
}
variable "lb_security_group_ids" {
  type = string
}
variable "lb_public_subnet" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
variable "port" {
  type = number
}
variable "protocol" {
  type = string
}
variable "type" {
  type = string
}
variable "target_group_arn" {
  type = string
}