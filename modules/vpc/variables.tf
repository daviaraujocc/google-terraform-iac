variable "project_id" {
  description = "Project ID"
}

variable "region" {
  description = "Region"
}

variable "vpc_network_name" {
  description = "VPC network name"
}

variable "vpc_network_subnet_name" {
  description = "subnetwork name"
}

variable "vpc_network_subnet_cidr" {
  description = "CIDR range"
}

variable "allowed_ports" {
  description = "Allowed ports for instance group (list)"
}

variable "tags" {
  description = "instance tags"
}