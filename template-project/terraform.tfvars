project_id = "{{.PROJECTID}}"

environment = "{{.ENV}}"

tags = ["web", "{{.ENV}}"]


## NETWORKING

vpc_network_name        = "vpc"
vpc_network_region      = "us-central1"
vpc_network_subnet_name = "subnet"
vpc_network_subnet_cidr = "10.0.0.0/8"
allowed_tcp_ports       = ["80", "8080"]


## INSTANCE TEMPLATE

instance_template_name         = "template"
instance_template_machine_type = "e2-micro"
instance_template_disk_size    = "100"
instance_template_disk_type    = "pd-standard"
instance_template_image        = "ubuntu-minimal-2004-lts"
instance_template_labels       = { "env" : "{{.ENV}}" }

## INSTANCE GROUP

instances_name       = "web"
instances_zone       = "us-central1-a"
instances_group_name = "group"
instances_count      = 2

# AUTOSCALER

instances_autoscaler_name            = "autoscaler"
instances_autoscaler_max_replicas    = "2"
instances_autoscaler_min_replicas    = "1"
instances_autoscaler_cooldown_period = "30"
#### Use only numbers 0.1 is 10% and 1.0 is 100% of cpu usage
instances_autoscaler_cpu_utilization_target = 0.5

## LOAD BALANCER

