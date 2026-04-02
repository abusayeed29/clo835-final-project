variable "app_repo_name" {
  description = "ECR repository name for application container"
  type        = string
  default     = "clo835-app"
}

variable "mysql_repo_name" {
  description = "ECR repository name for MySQL container"
  type        = string
  default     = "clo835-mysql"
}

variable "tags" {
  description = "Tags to apply to ECR repositories"
  type        = map(string)
  default     = {}
}
