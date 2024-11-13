variable "region" {
  default = "us-east-1"
}
variable "profile" {
  default = "default"
}
variable "route53_zone_id" {
  type = string
}
variable "subdomain_name" {
  type = string
}
variable "type" {
  type = string
}
# variable "ttl" {
#   type = number
# }
# variable "records" {
#   type = string
# }
variable "evaluate_target_health" {
  type = string
}
variable "alb_dns_name" {
  type = string
}
variable "alb_zone_id" {
  type = string
}