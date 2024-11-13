variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "key_name" {
  description = "create keypair ressource"
  type = string
}
variable "permission" {
  description = "add permission at the key created"
  type = number
}