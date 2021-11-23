all: plan

.PHONY: init
init:
	terraform -chdir=my-service/ init

.PHONY: validate
validate:
	terraform -chdir=my-service/ fmt
	terraform -chdir=my-service/ validate

.PHONY: plan
plan:
	terraform -chdir=my-service/ plan  -var-file terraform.tfvars -out terraform.tfplan

.PHONY: run
apply:
	terraform -chdir=my-service/ apply  -var-file terraform.tfvars

.PHONY: destroy
destroy:
	terraform -chdir=my-service/ plan  -destroy -var-file terraform.tfvars -out terraform.tfplan
	terraform -chdir=my-service/ apply  terraform.tfplan