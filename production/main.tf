module "vpc_network" {
  source = "../modules/vpc"

  project_id              = var.project_id
  vpc_network_name        = "${var.vpc_network_name}-${var.environment}"
  vpc_network_region      = var.region
  vpc_network_subnet_name = var.vpc_network_subnet_name
  vpc_network_subnet_cidr = var.vpc_network_subnet_cidr
  allowed_tcp_ports       = var.allowed_tcp_ports
  tags                    = var.tags

}

module "instance_template" {
  source = "../modules/template"

  instance_template_name          = "${var.instance_template_name}-${var.environment}"
  instance_template_machine_type  = var.instance_template_machine_type
  instance_template_image         = var.instance_template_image
  instance_template_disk_size     = var.instance_template_disk_size
  instance_template_disk_type     = var.instance_template_disk_type
  instance_template_network_name  = "${var.vpc_network_name}-${var.environment}"
  instance_template_tags          = var.tags
  instance_template_labels        = var.instance_template_labels
  instance_template_subnetwork_id = module.vpc_network.output_subnetwork_id
}

module "instances" {
  source = "../modules/instances"

  instances_name                 = "${var.instances_name}-${var.environment}"
  instances_count                = var.instances_count
  instances_zone                 = var.instances_zone
  instances_region               = var.region
  instances_group_name           = "${var.instances_group_name}-${var.environment}"
  instances_group_regional       = var.instances_group_regional
  instances_group_regional_zones = var.instances_group_regional_zones
  instances_template_id          = module.instance_template.output_template_id

  # Autoscaler

  instances_autoscaler_name                   = "${var.instances_autoscaler_name}-${var.environment}"
  instances_autoscaler_max_replicas           = var.instances_autoscaler_max_replicas
  instances_autoscaler_min_replicas           = var.instances_autoscaler_min_replicas
  instances_autoscaler_cooldown_period        = var.instances_autoscaler_cooldown_period
  instances_autoscaler_cpu_utilization_target = var.instances_autoscaler_cpu_utilization_target
}
