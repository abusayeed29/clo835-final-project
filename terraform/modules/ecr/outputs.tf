output "app_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "mysql_repository_url" {
  value = aws_ecr_repository.mysql.repository_url
}