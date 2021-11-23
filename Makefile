all: plan

.PHONY: plan
plan:
    terraform plan my-service/. -var-file terraform.tfvars -out terraform.tfplan

.PHONY: apply
apply:
    terraform apply my-service/. -var-file terraform.tfvars

.PHONY: destroy
destroy:
    terraform plan my-service/. -destroy -var-file terraform.tfvars -out terraform.tfplan
    terraform apply my-service/. terraform.tfplan

.PHONY: image-names
image-names:
    terraform output my-service/. -json | jq -r '.image_names | join(" ")'