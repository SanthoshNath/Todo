include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "github.com/SanthoshNath/EKS?ref=master"
}

dependency "vpc" {
  config_path = "${path_relative_from_include("root")}/${include.root.locals.environment_vars.locals.environment}/vpc"

  mock_outputs = {
    vpc_id = "vpc-12345"
  }
  mock_outputs_allowed_terraform_commands = ["init", "validate"]
}

inputs = {
  vpc_id      = dependency.vpc.outputs.vpc_id
  name_prefix = include.root.locals.environment_vars.locals.cluster_name
  fargate_profiles = {
    default = {
      name = "default"
      selectors = [
        {
          namespace = "default"
        },
        {
          namespace = "kube-system"
        }
      ]
    }
  }
}
