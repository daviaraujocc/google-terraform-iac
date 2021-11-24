

variable "project_id" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
}

variable "tags" {
  description = "instance tags"
}

variable "environment" {
  description = "Environment"
}

######  VPC

variable "vpc_network_name" {
  description = "VPC network name"
}

variable "vpc_network_subnet_name" {
  description = "subnetwork name"
}

variable "vpc_network_subnet_cidr" {
  description = "CIDR range"
}

variable "allowed_tcp_ports" {
  description = "Allowed ports for instance group (list)"
}

variable "vpc_network_region" {
  description = "Region"
}


## Template

variable "instance_template_name" {}
variable "instance_template_machine_type" {}
variable "instance_template_image" {}
variable "instance_template_disk_size" {}
variable "instance_template_disk_type" {}
variable "instance_template_labels" {}


## Managed instances

variable "instances_name" {}
variable "instances_count" {}
variable "instances_zone" {}
variable "instances_group_name" {}