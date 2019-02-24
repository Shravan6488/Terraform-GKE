resource "kubernetes_replication_controller" "nginx" {
  metadata {
    name = "shravan-nginx-example"
    labels {
      App = "shravannginxexample"
    }
  }

  spec {
    replicas = 2
    selector {
      App = "shravannginxexample"
    }
    template {
      container {
        image = "nginx:1.7.8"
        name  = "test-nginx"

        port {
          container_port = 80
        }
        
        env {
          name  = "GET_HOSTS_FROM"
          value = "dns"
        }
        
        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }
          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "shravan-nginx-example"
  }
  spec {
    selector {
      App = "${kubernetes_replication_controller.nginx.metadata.0.labels.App}"
    }
    port {
      port = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
