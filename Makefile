args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

all: plan

.PHONY: init
init:
	terraform -chdir=$(call args, production)/ init

.PHONY: validate
validate:
	terraform -chdir=$(call args, production)/ fmt
	terraform -chdir=$(call args, production)/ validate

.PHONY: plan
plan:
	terraform -chdir=$(call args, production)/ plan  -var-file terraform.tfvars -out terraform.tfplan

.PHONY: run
apply:
	terraform -chdir=$(call args, production)/ apply  -var-file terraform.tfvars

.PHONY: destroy
destroy:
	terraform -chdir=$(call args, production)/ plan  -destroy -var-file terraform.tfvars -out terraform.tfplan
	terraform -chdir=$(call args, production)/ apply  terraform.tfplan