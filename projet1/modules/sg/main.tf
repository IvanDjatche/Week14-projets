# Security Group for ALB
resource "aws_security_group" "alb_sg" {
  name        = var.alb_name
  description = "Allow inbound HTTP/HTTPS traffic from anywhere for ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  ingress {
    description = "Allow HTTPS from anywhere"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    env  = var.Env
    team = var.Team
  }
}

# Security Group for Bastion Host
resource "aws_security_group" "bastion_host_sg" {
  name        = var.bastian_name
  description = "Allow SSH access from my IP to Bastion Host"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.cidr_blocks]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    env  = var.Env
    team = var.Team
  }
}

# Security Group for Application Servers
resource "aws_security_group" "app_server_sg" {
  name        = var.app_name
  description = "Allow HTTP from ALB and SSH from Bastion Host to App Servers"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ingress {
    description     = "Allow SSH from Bastion Host"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_host_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

   tags = {
    env  = var.Env
    team = var.Team
  }
}

# Security Group for Database
resource "aws_security_group" "database_sg" {
  name        = var.database_name
  description = "Allow MySQL from App Servers to Database"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from App Servers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.app_server_sg.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

 tags = {
    env  = var.Env
    team = var.Team
  }
}

resource "aws_security_group" "efs_sg" {
  name   = var.efs_name
  vpc_id = var.vpc_id

  ingress {
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.app_server_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_blocks]
  }

  tags = {
    env  = var.Env
    team = var.Team
  }
}
