# Public Route Table
resource "aws_route_table" "public_route" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.cidr_block
    gateway_id = var.internet_gateway_ids
  }

  tags = {
    Name = var.Name
  }
}
# Private Route Tables with NAT Gateway
resource "aws_route_table" "private_route" {
  count  = 2
  vpc_id = var.vpc_id

  route {
    cidr_block     = var.cidr_block
    nat_gateway_id = var.nat_gateway_ids
  }

  tags = {
    Name = "${var.Name}-${count.index + 1}"
  }
}
# create Route Tables association 
resource "aws_route_table_association" "utc_rta" {
  subnet_id = var.association_subnet_id
  route_table_id = aws_route_table.public_route.id
}