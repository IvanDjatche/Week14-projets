variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "vpc_id_igw" {
  description = "internet gatway"
  type = string
}
variable "Name" {
  description = "create name tags resource"
  type = string
  default = "utc-igw"
}