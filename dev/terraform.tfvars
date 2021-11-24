project_id = "gcp-davi-331018"

region = "us-central1"

tags = ["web", "app"]


## NETWORKING

vpc_network_name        = "vpc1"
vpc_network_region      = "us-central1"
vpc_network_subnet_name = "sub1"
vpc_network_subnet_cidr  = "10.0.0.0/8"
allowed_tcp_ports       = ["80", "8080"]


## INSTANCE TEMPLATE

instance_template_name         = "template1"
instance_template_machine_type = "e2-micro"
instance_template_disk_size    = "100"
instance_template_disk_type    = "pd-standard"
instance_template_image   = "debian-cloud/debian9"
instance_template_labels       = { "app" : "web" }

## INSTANCE GROUP

instances_name = "test"
instances_zone = "us-central1-a"
instances_group_name = "instance_group_1"
instances_count = 2