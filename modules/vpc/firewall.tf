resource "google_compute_firewall" "fw" {
  name    = ""
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "icmp"
  }

  dynamic "allow" {
      for_each = var.allowed_tcp_ports
      content {
            protocol = "tcp"
            ports    = var.allowed_tcp_ports
      }
  }

  source_tags = [var.tags]
}