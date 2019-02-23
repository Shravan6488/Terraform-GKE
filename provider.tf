
provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "terraform-gke-demo"
  region      = "europe-west1"
}
