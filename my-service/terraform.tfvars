project_id = ""

region = "us-central1"

tags = ["web", "app"] 

## NETWORKING

vpc_network_name = "vpc_1"

network_subnet_name = "subnetwork_1"

network_cidr_range = "10.0.0.0/8"

allowed_tcp_ports = ["80", "8080"]


## INSTANCE TEMPLATE

instance_template_name = "instance_template_1"
instance_template_machine_type = "n1-standard-1"
instance_template_disk_size = "100"
instance_template_disk_type = "pd-standard"
instance_template_image_name = "ubuntu-1604-xenial-v20180208"
instance_template_labels = {"app": "web"}