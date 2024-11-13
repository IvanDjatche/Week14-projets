output "id1" {
  value = aws_subnet.private_subnet[*].id
}
output "arn1" {
  value = aws_subnet.private_subnet[*].arn
}

output "id2" {
  value = aws_subnet.public_subnet[*].id
}
output "arn2" {
  value = aws_subnet.public_subnet[*].arn
}