include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "github.com/SanthoshNath/VPC?ref=master"
}

inputs = {
  vpc_cidr_block = "192.168.0.0/16"
  name_prefix    = include.root.locals.environment_vars.locals.cluster_name
  additional_public_subnet_tags = {
    "kubernetes.io/cluster/${include.root.locals.environment_vars.locals.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                                                            = "1"
  }
  additional_private_subnet_tags = {
    "kubernetes.io/cluster/${include.root.locals.environment_vars.locals.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"                                                   = "1"
  }
}
