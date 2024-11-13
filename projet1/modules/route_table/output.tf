output "private_route_id" {
  value = aws_route_table.private_route[*].id
}
output "public_route_id" {
  value = aws_route_table.public_route.id
}
output "arn" {
  value = aws_route_table.private_route[*].arn
}
output "tags" {
  value = aws_route_table.private_route[*].tags
}