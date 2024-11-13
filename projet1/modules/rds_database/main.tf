resource "aws_db_instance" "utc_dev_database" {
  identifier          = var.identifier
  engine              = var.engine
  engine_version      = var.engine_version
  instance_class      = var.instance_class
  allocated_storage   = var.allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type        = var.storage_type
  username            = var.username
  password            = var.password
  publicly_accessible = false
  vpc_security_group_ids = [var.database_sg_ids]  # Replace with your database security group ID
  db_subnet_group_name   = aws_db_subnet_group.utc_db_subnet_group.name

  tags = {
    Name = var.db_instance_Name
    env  = var.Env
    team = var.Team
  }
}

resource "aws_db_subnet_group" "utc_db_subnet_group" {
  name       = var.db_subnet_name

  subnet_ids = [var.subnet_ids]  # Replace with your VPC’s private subnet IDs

  tags = {
    Name = var.db_subnet_name
    env  = var.Env
    team = var.Team
  }
}
