resource "google_compute_instance_template" "template_default" {
  name        = var.instance_template_name
  description = "Templated created for instance group web app"

  tags   = var.instance_template_tags
  labels = var.instance_template_labels

  instance_description = "description assigned to instances"
  machine_type         = var.instance_template_machine_type
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }


  disk {
    source_image = var.instance_template_image
    auto_delete  = true
    boot         = true
    disk_type    = var.instance_template_disk_type
    disk_size_gb = var.instance_template_disk_size
  }


  metadata_startup_script = "sudo apt install nginx -y ; echo 'Welcome from host: $(hostname)' > /usr/share/nginx/www/index.html"


  
  network_interface {
    network = var.instance_template_network_name
    subnetwork = var.instance_template_subnetwork_id
    access_config {}
  }

}

output "output_template_id" {
  value = "${google_compute_instance_template.template_default.id}"
}