output "database_id" {
  value = aws_db_instance.utc_dev_database.id
}
output "database_arn" {
  value = aws_db_instance.utc_dev_database.arn
}
output "database_db_name" {
  value = aws_db_instance.utc_dev_database.db_name
}
output "db_subnet_group_name" {
  value = aws_db_subnet_group.utc_db_subnet_group.name
}