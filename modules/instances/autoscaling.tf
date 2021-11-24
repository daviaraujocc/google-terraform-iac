resource "google_compute_region_autoscaler" "autoscaler-region" {

  name   = var.instances_autoscaler_name
  region  = var.instances_region
  target = google_compute_region_instance_group_manager.app-server[0].id
  count = var.instances_group_regional == true ? 1 : 0

  autoscaling_policy {
    max_replicas    = var.instances_autoscaler_max_replicas
    min_replicas    = var.instances_autoscaler_min_replicas
    cooldown_period = var.instances_autoscaler_cooldown_period

    cpu_utilization {
      target = var.instances_autoscaler_cpu_utilization_target
    }
  }
}

resource "google_compute_autoscaler" "autoscaler-zone" {

  name   = var.instances_autoscaler_name
  zone   = var.instances_zone
  target = google_compute_instance_group_manager.app-server[0].id
  count = var.instances_group_regional == false ? 1 : 0
  
  autoscaling_policy {
    max_replicas    = var.instances_autoscaler_max_replicas
    min_replicas    = var.instances_autoscaler_min_replicas
    cooldown_period = var.instances_autoscaler_cooldown_period

    cpu_utilization {
      target = var.instances_autoscaler_cpu_utilization_target
    }
  }
}