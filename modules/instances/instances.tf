
resource "google_compute_target_pool" "app-server-pool" {
  name = var.instances_group_name
}

resource "google_compute_instance_group_manager" "app-server" {
  name = var.instances_group_name
  count = var.instances_group_regional == false ? 1 : 0

  base_instance_name = var.instances_name
  zone               = var.instances_zone

  version {
    instance_template = var.instances_template_id
  }



  target_pools = [google_compute_target_pool.app-server-pool.id]
  target_size  = var.instances_count


  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}

resource "google_compute_region_instance_group_manager" "app-server" {
  name = var.instances_group_name
  count = var.instances_group_regional == true ? 1 : 0

  base_instance_name = var.instances_name
  region                     = var.instances_region
  distribution_policy_zones  = var.instances_group_regional_zones

  version {
    instance_template = var.instances_template_id
  }



  target_pools = [google_compute_target_pool.app-server-pool.id]
  target_size  = var.instances_count


  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 300
  }
}