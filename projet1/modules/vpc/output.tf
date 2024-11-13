# Output VPC, Subnet, and NAT Gateway IDs
output "vpc_id" {
  value = aws_vpc.utc_vpc.id
}
output "cidr_block" {
  value = aws_vpc.utc_vpc.cidr_block
}
# output "public_subnet_ids" {
#   value = aws_subnet.public_subnet[*].id
# }

# output "private_subnet_ids" {
#   value = aws_subnet.private_subnet[*].id
# }

# output "nat_gateway_ids" {
#   value = aws_nat_gateway.nat_gateway[*].id
# }