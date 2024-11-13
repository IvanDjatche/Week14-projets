# NAT Gateways in each public subnet
resource "aws_eip" "nat_eip" {
  count = 2
  domain = var.domain
  
 
  tags = {
    Name = "utc-nat-eip-${count.index + 1}"
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = 2
  allocation_id = aws_eip.nat_eip[count.index].id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.Name}-${count.index + 1}"
  }
}
# subnet_id     = module.subnet.public_subnet[count.index].id