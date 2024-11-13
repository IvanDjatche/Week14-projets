# Create Internet Gateway
resource "aws_internet_gateway" "utc-igw" {
  
  vpc_id = var.vpc_id_igw

  tags = {
    Name = var.Name
  }
}
