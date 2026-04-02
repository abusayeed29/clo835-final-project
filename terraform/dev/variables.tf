variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "clo835"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "final"
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "clo835-cluster"
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  type        = string
  default     = "1.29"
}

variable "node_group_name" {
  description = "Managed node group name"
  type        = string
  default     = "final-workers"
}

variable "node_instance_types" {
  description = "EKS worker node instance types"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "desired_size" {
  description = "Desired worker node count"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum worker node count"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum worker node count"
  type        = number
  default     = 3
}

variable "app_repo_name" {
  description = "ECR repository for Flask app"
  type        = string
  default     = "clo835-app"
}

variable "mysql_repo_name" {
  description = "ECR repository for MySQL image"
  type        = string
  default     = "clo835-mysql"
}

variable "bucket_name" {
  description = "Globally unique S3 bucket name for private background images"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "final"
}

variable "service_account_name" {
  description = "IRSA service account name"
  type        = string
  default     = "clo835"
}

variable "force_destroy_bucket" {
  description = "Allow Terraform to destroy bucket even if it contains objects"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}