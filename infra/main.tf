locals {
  name_prefix = "todo"
}

module "vpc" {
  source = "github.com/benzene-tech/vpc?ref=v1.1.0"

  name_prefix = local.name_prefix
  vpc_cidr    = var.vpc_cidr
}

module "eks" {
  source = "github.com/benzene-tech/eks?ref=v1.1.2"

  vpc_id                    = module.vpc.vpc_id
  name_prefix               = local.name_prefix
  eks_cluster_iam_role_name = "BenzeneEKS"
  node_group_iam_role_name  = "BenzeneNodeGroup"
  node_groups = {
    todo = {
      subnet_type = "public"
      scaling = {
        desired_size = 1
        max_size     = 3
        min_size     = 1
      }
    }
  }
}
