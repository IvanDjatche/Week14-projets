variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "cidr_block" {
  type = string
  # default = "10.10.0.0/16"
}
variable "route_cidr_block" {
  default = "0.0.0.0/0"
}
variable "Env" {
  type = string
}
variable "Name" {
  type = string
}
variable "Team" {
  type = string
}