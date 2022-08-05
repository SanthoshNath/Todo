resource "kubernetes_service" "service" {
  metadata {
    name = "todo-service"
  }
  spec {
    selector = {
      app = "todo-pod"
    }
    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 80
      node_port   = 32585
    }
    type = "NodePort"
  }
}

resource "kubernetes_deployment" "deployment" {
  metadata {
    name = "todo-deployment"
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "todo-pod"
      }
    }
    template {
      metadata {
        labels = {
          app = "todo-pod"
        }
      }
      spec {
        container {
          image = "santhoshnath/todo"
          name  = "todo"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
