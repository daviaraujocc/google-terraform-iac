data "http" "local_ip" {
  url = "http://ipv4.icanhazip.com"
}

resource "google_compute_firewall" "rule_healthcheck" {
  name    = "allow-health-checks"
  network = google_compute_network.vpc_network.id


  # Allow incoming health checks
  allow {
    protocol = "tcp"
    source_ranges = ["130.211.0.0/22","35.191.0.0/16"]
    ports = ["80"]
    
  }

  source_tags = [var.tags]
}

resource "google_compute_firewall" "rule_custom" {
  name    = "allow-custom-ports"
  network = google_compute_network.vpc_network.id

dynamic "allow" {
      for_each = var.allowed_tcp_ports
      content {
            protocol = "tcp"
            ports    = var.allowed_tcp_ports
      }
  }

source_tags = [var.tags]
}

resource "google_compute_firewall" "rule_ssh" {
  name    = "allow-custom-ports"
  network = google_compute_network.vpc_network.id

# Allow SSH to local machine
 allow {
        protocol = "tcp"
        ports    = ["22"]
        source_ranges = ["${chomp(data.http.local_ip.body)}"]
  }

source_tags = [var.tags]
}