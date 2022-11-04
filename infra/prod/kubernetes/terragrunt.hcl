include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "${path_relative_from_include("root")}/modules//kubernetes"
}

inputs = {
  service_name = "todo-service-${include.root.locals.environment_vars.locals.environment}"
  service_selector = {
    app = "todo-pod-${include.root.locals.environment_vars.locals.environment}"
  }
  service_port = [
    {
      protocol    = "TCP"
      port        = 3000
      target_port = 80
      node_port   = 32585
    }
  ]
  deployment_name     = "todo-deployment-${include.root.locals.environment_vars.locals.environment}"
  deployment_replicas = 3
  deployment_labels = {
    app = "todo-pod-${include.root.locals.environment_vars.locals.environment}"
  }
  deployment_container_image = "ghcr.io/santhoshnath/todo"
  deployment_container_name  = "todo-${include.root.locals.environment_vars.locals.environment}"
  deployment_container_port  = [80]
}
