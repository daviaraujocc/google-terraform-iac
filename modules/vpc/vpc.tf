resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc_network_subnet" {
  name          = var.vpc_network_subnet_name
  ip_cidr_range = var.vpc_network_subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc_network.id
}