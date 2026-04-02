output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Cluster security group"
  value       = module.eks.cluster_security_group_id
}

output "node_role_arn" {
  description = "IAM role used by worker nodes"
  value       = module.eks.node_role_arn
}

output "ecr_app_repository_url" {
  description = "Flask app ECR URL"
  value       = module.ecr.app_repository_url
}

output "ecr_mysql_repository_url" {
  description = "MySQL ECR URL"
  value       = module.ecr.mysql_repository_url
}

output "background_bucket_name" {
  description = "Private S3 bucket for background images"
  value       = module.s3.bucket_id
}

output "background_bucket_arn" {
  description = "Private S3 bucket ARN"
  value       = module.s3.bucket_arn
}

output "irsa_role_arn" {
  description = "IAM role ARN for Kubernetes service account clo835"
  value       = module.irsa.role_arn
}

output "configure_kubectl" {
  description = "Command to configure kubectl"
  value       = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}