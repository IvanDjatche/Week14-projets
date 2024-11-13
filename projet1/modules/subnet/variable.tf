variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "vpc_id" {
  description = "allow vpc for subnet"
  type = string
}
variable "public_sub_count" {
  type = number
}
variable "private_sub_count" {
  type = number
}
variable "vpc_cidr_block" {
  type = string
}
variable "availability_zone" {
  type = string
}
variable "public_sub_name" {
  type = string
}
variable "private_sub_name" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
