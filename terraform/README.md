# CLO835 Final Project Terraform

This Terraform project provisions the AWS infrastructure for the CLO835 final project:

- 2 ECR repositories (`clo835-app`, `clo835-mysql`)
- 1 private S3 bucket for background images
- 1 Amazon EKS cluster
- 1 managed node group with 2 worker nodes
- IAM OIDC provider for the cluster
- IRSA role for Kubernetes service account `clo835`

## Files

- `providers.tf` - Terraform and provider versions
- `variables.tf` - input variables
- `main.tf` - root module wiring
- `outputs.tf` - useful output values
- `terraform.tfvars.example` - example variable values
- `modules/` - reusable Terraform modules

## Usage

```bash
terraform init
cp terraform.tfvars.example terraform.tfvars
terraform plan
terraform apply