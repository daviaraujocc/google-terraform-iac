provider "google" {
  credentials = file("../auth/terraform-svc.json")
  version     = "~> 4.0.0"
  project     = var.project_id
  region      = var.region
}