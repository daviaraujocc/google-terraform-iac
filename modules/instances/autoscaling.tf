resource "google_compute_autoscaler" "default" {

  name   = var.instances_autoscaler_name
  zone   = var.instances_zone
  target = google_compute_instance_group_manager.webserver.id

  autoscaling_policy {
    max_replicas    = var.instances_autoscaler_max_replicas
    min_replicas    = var.instances_autoscaler_min_replicas
    cooldown_period = var.instances_autoscaler_cooldown_period

    cpu_utilization {
      target = var.instances_autoscaler_cpu_utilization_target
    }
  }
}