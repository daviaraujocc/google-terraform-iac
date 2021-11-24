terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  credentials = file("auth/terraform-svc.json")
  project     = var.project_id
  region      = var.region
}