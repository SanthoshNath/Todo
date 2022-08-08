include "root" {
  path   = find_in_parent_folders()
  expose = true
}

terraform {
  source = "${path_relative_from_include("root")}/modules/kubernetes"
}

inputs = {
  service_name = "todo-service"
  service_selector = {
    app = "todo-pod"
  }
  service_port = [
    {
      protocol    = "TCP"
      port        = 3000
      target_port = 80
      node_port   = 32585
    }
  ]

  deployment_name     = "todo-deployment"
  deployment_replicas = 2
  deployment_labels = {
    app = "todo-pod"
  }
  deployment_container_image = "santhoshnath/todo"
  deployment_container_name  = "todo"
  deployment_container_port = [
    80
  ]
}
