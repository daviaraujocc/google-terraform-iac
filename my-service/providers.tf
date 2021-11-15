provider "google" {
  version = "~> 4.0.0"
  project = "${var.project_id}"
  region  = "${var.region}"
}