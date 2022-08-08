locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "kubernetes" {
  config_path = "~/.kube/config"
}
EOF
}
