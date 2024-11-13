# Public Subnets
resource "aws_subnet" "public_subnet" {
  count                   = var.public_sub_count
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  availability_zone       = "${var.availability_zone}${element(["a", "b","c"], count.index)}"
  map_public_ip_on_launch = true
  


  tags = {
    Name = "${var.public_sub_name}-${count.index + 1}"
    env  = var.Env
    team = var.Team
  }
}

# Private Subnets
resource "aws_subnet" "private_subnet" {
  count             = var.private_sub_count
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index + 2)
  availability_zone = "${var.availability_zone}${element(["a", "b","c"], count.index % 2)}"

   tags = {
    Name = "${var.private_sub_name}-${count.index + 1}"
    env  = var.Env
    team = var.Team
  }
}
