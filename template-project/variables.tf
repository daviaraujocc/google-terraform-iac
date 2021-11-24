

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


## Template

variable "instance_template_name" {
  description = "Instance template name"
}
variable "instance_template_machine_type" {
  description = "Machine type"
}
variable "instance_template_image" {
  description = "VM Image"
}
variable "instance_template_disk_size" {
  description = "Boot Disk size"
}
variable "instance_template_disk_type" {
  description = "Boot Disk type"
}
variable "instance_template_labels" {
  description = "Template Labels"
}


## Managed instances

variable "instances_name" {
  description = "Individual instances name"
}
variable "instances_count" {
  description = "Number of instances"
}
variable "instances_zone" {
  description = "Zone where instances will be"
}
variable "instances_group_name" {
  description = "Instance group name"
}
variable "instances_group_regional" {
  description = "Define if instance group is single zone or multiple zone"
}
variable "instances_group_regional_zones" {
  description = "zones where instances will be"
}
variable "instances_autoscaler_name" {
  description = "Autoscaler name"
}
variable "instances_autoscaler_max_replicas" {
  description = "Autoscaler max replicas"
}
variable "instances_autoscaler_min_replicas" {
  description = "Autoscaler min replicas"
}
variable "instances_autoscaler_cooldown_period" {
  description = "Autoscaler cooldown period"
}
variable "instances_autoscaler_cpu_utilization_target" {
  description = "Autoscaler cpu utilization target"
}