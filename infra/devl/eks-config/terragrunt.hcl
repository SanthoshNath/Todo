include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "github.com/SanthoshNath/EKS-ALB-controller?ref=master"
}

dependencies {
  paths = ["${path_relative_from_include("root")}/${include.root.locals.environment_vars.locals.environment}/eks"]
}

inputs = {
  cluster_name = include.root.locals.environment_vars.locals.cluster_name
}
