resource "kubernetes_service" "node_service" {
  metadata {
    name = var.service_name
  }
  spec {
    selector = var.service_selector
    dynamic "port" {
      for_each = var.service_port

      content {
        protocol    = port.value["protocol"]
        port        = port.value["port"]
        target_port = port.value["target_port"]
        node_port   = port.value["node_port"]
      }
    }
    type = "NodePort"
  }
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name = var.deployment_name
  }

  spec {
    replicas = var.deployment_replicas
    selector {
      match_labels = var.deployment_labels
    }
    template {
      metadata {
        labels = var.deployment_labels
      }
      spec {
        container {
          image = var.deployment_container_image
          name  = var.deployment_container_name
          dynamic "port" {
            for_each = var.deployment_container_port

            content {
              container_port = port.value
            }
          }
        }
      }
    }
  }
}
