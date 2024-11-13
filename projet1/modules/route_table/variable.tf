variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "vpc_id" {
  description = "vpc for route_table"
  type = string
}
variable "cidr_block" {
  description = "cidr_block for route_table"
  type = string
}
variable "internet_gateway_ids" {
  description = "internet gateway for route_table"
  type = string
}
variable "Name" {
  type = string
}
# variable "count"{
#   type = number
# }
variable "nat_gateway_ids" {
  description = "nat gateway for route_table"
  type = string
}
variable "association_subnet_id" {
  description = "association subnet with route table"
  type = string
}
# variable "association_route_table_id" {
#   description = "association route table with subnet"
#   type = string
# }