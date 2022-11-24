locals {
  environment  = "prod"
  aws_region   = "ap-south-1"
  cluster_name = "todo-${local.environment}"
}
