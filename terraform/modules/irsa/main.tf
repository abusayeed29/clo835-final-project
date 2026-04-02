locals {
  oidc_provider_hostpath = replace(var.oidc_provider_url, "https://", "")
}

resource "aws_iam_role" "this" {
  name = "${var.cluster_name}-${var.service_account_name}-irsa-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = var.oidc_provider_arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "${local.oidc_provider_hostpath}:aud" = "sts.amazonaws.com"
          "${local.oidc_provider_hostpath}:sub" = "system:serviceaccount:${var.namespace}:${var.service_account_name}"
        }
      }
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "s3_read_policy" {
  name = "${var.cluster_name}-${var.service_account_name}-s3-read-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          var.s3_bucket_arn,
          "${var.s3_bucket_arn}/*"
        ]
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.s3_read_policy.arn
}