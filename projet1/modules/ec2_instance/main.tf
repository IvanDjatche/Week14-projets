# Application Server 1 in us-east-1a
resource "aws_instance" "utc-server-1a" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids_instance1
  key_name               = var.key_name
  vpc_security_group_ids = [var.app_security_group]
  iam_instance_profile = var.iam_instance_profile

  user_data = file(var.instalFile)

  tags = {
    Name = "${var.Name}A"
    env  = var.Env
    team = var.Team
  }
}

# Application Server 2 in us-east-1b
resource "aws_instance" "utc-server-1b" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet_ids_instance2
  key_name               = var.key_name
  vpc_security_group_ids = [var.app_security_group]
  iam_instance_profile   = var.iam_instance_profile

  user_data = file(var.instalFile)

  tags = {
    Name = "${var.Name}B"
    env  = var.Env
    team = var.Team
  }
}

resource "aws_ami_from_instance" "utc_app_server_ami" {
  name               = var.ami_from_instance_name
  source_instance_id = aws_instance.utc-server-1a.id  # Replace with the instance ID of an existing app server
  description        = "AMI for UTC app server with pre-configured setup"
  tags = {
    Name = var.ami_from_instance_name
    env  = var.Env
    team = var.Team
  }
}