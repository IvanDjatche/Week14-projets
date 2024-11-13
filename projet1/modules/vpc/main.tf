# Create VPC
resource "aws_vpc" "utc_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.Name
    env  = var.Env
    team = var.Team
  }
}
