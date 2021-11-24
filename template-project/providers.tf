terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.1.0"
    }
  }
}

provider "google" {
  ## Insert service account here or use google auth to authenticate
  #credentials = file("")
  project     = var.project_id
}