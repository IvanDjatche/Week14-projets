output "eip_id" {
  value = aws_eip.nat_eip[*].id
}
output "eip_adresse" {
  value = aws_eip.nat_eip[*].address
}
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway[*].id
}