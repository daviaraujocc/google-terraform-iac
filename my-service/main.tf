module "vpc_network" {
  source = "../modules/vpc"

  vpc_network_name = var.vpc_network_name
  vpc_network_subnet_name = var.vpc_network_subnet_name
  vpc_network_subnet_cidr = var.vpc_network_subnet_cidr
  allowed_tcp_ports = var.allowed_tcp_ports
  tags = var.tags
  
}

module "instance_template" {
  source = "../modules/template"

  instance_template_name = var.instance_template_name
  instance_template_machine_type = var.instance_template_machine_type
  instance_template_image = var.instance_template_image
  instance_template_disk_size = var.instance_template_disk_size
  instance_template_disk_type = var.instance_template_disk_type
  instance_template_network_name = var.vpc_network_name
  instance_template_tag = var.tags
  instance_template_labels = var.labels
}


