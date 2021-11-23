resource "google_compute_health_check" "autohealing" {
  name                = "autohealing-health-check"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}

resource "google_compute_target_pool" "webserver" {
  name = var.instnaces_group_name

  instances = []
}

resource "google_compute_instance_group_manager" "webserver" {
  name = var.instances_group_name

  base_instance_name = var.instances_name
  zone               = var.instances_zone

  version {
    instance_template  = google_compute_instance_template.template_default.id
  }

  target_pools = [google_compute_target_pool.webserver.id]
  target_size  = var.instances_count


  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}