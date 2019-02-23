resource "google_container_cluster" "gke-cluster" {
  name               = "Devops-gke-cluster"
  network            = "default"
  zone               = "europe-west1-b"
  initial_node_count = 3
}
