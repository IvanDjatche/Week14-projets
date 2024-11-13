  data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

## If you want to create your own aws_iam from existing instance, you can use these two block of code 
# resource "aws_ami_from_instance" "utc_app_server_ami" {
#   name               = "utcappserver"
#   source_instance_id = aws_instance.app_server_1a.id  # Replace with the instance ID of an existing app server
#   description        = "AMI for UTC app server with pre-configured setup"
#   tags = {
#     Name = "utcappserver"
#     env  = "dev"
#     team = "config management"
#   }
# }
# resource "aws_instance" "app_server_new" {
#   ami           = aws_ami_from_instance.utc_app_server_ami.id  # Use the AMI ID from the newly created AMI
#   instance_type = "t2.micro"
#   subnet_id     = module.vpc.private_subnets[0]  # Replace with the appropriate subnet
#   security_groups = [aws_security_group.app_server_sg.id]
#   key_name      = "utc-key"  # Replace with your key pair

#   tags = {
#     Name = "new-app-server"
#     env  = "dev"
#     team = "config management"
#   }
# }
