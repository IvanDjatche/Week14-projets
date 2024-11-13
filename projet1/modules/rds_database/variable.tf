variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "identifier" {
  type = string
}
variable "engine" {
  type = string
}
variable "engine_version" {
  type = string
}
variable "instance_class" {
  type = string
}
variable "allocated_storage" {
  type = number
}
variable "max_allocated_storage" {
  type = number
}
variable "storage_type" {
  type = string
}
variable "username" {
  type = string
}
variable "password" {
  type = string
}
variable "database_sg_ids" {
  type = string
}
variable "db_instance_Name" {
  type = string
}
variable "Env" {
  type = string
}
variable "Team" {
  type = string
}
variable "db_subnet_name" {
  type = string
}
variable "subnet_ids" {
  type = string
}