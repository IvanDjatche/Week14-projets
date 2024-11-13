output "instance-ida" {
  value = module.ec2_instance.app_1a_id
}
output "instance-ipa" {
  value = module.ec2_instance.app_1a_private_ip
}
output "instance-idb" {
  value = module.ec2_instance.app_1b_id
}
output "instance-ipb" {
  value = module.ec2_instance.app_1b_private_ip
}


# output "instance-arn" {
#   value = module.ec2_instance.key_name
# }
# output "instance2-id" {
#   value = module.ec2_instance.arn
# }