locals {
  common_tags = merge(
    {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
    },
    var.tags
  )
}

module "ecr" {
  source = "../modules/ecr"

  app_repo_name   = var.app_repo_name
  mysql_repo_name = var.mysql_repo_name
  tags            = local.common_tags
}

module "s3" {
  source = "../modules/s3"

  bucket_name   = var.bucket_name
  force_destroy = var.force_destroy_bucket
  tags          = local.common_tags
}

module "eks" {
  source = "../modules/eks"

  cluster_name        = var.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_group_name     = var.node_group_name
  node_instance_types = var.node_instance_types
  desired_size        = var.desired_size
  min_size            = var.min_size
  max_size            = var.max_size
  tags                = local.common_tags
}

module "irsa" {
  source = "../modules/irsa"

  cluster_name         = module.eks.cluster_name
  oidc_provider_arn    = module.eks.oidc_provider_arn
  oidc_provider_url    = module.eks.oidc_provider_url
  namespace            = var.namespace
  service_account_name = var.service_account_name
  s3_bucket_arn        = module.s3.bucket_arn
  tags                 = local.common_tags
}