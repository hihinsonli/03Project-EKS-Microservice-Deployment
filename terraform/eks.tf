# https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/latest
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "microservices-cluster"
  cluster_version = "1.29"

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  # EKS Managed Node Group
  eks_managed_node_groups = {
    default = {
      min_size     = 2
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.medium"]
      capacity_type  = "ON_DEMAND"

      labels = {
        Environment = "dev"
      }
    }
  }

  # Enable cluster encryption
  cluster_encryption_config = {
    resources = ["secrets"]
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
