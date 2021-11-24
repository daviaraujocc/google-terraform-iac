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

.PHONY: apply
apply:
	terraform -chdir=$(call args, production)/ apply terraform.tfplan

.PHONY: run
run:
	terraform -chdir=$(call args, production)/ plan  -var-file terraform.tfvars -out terraform.tfplan
	terraform -chdir=$(call args, production)/ apply terraform.tfplan

.PHONY: create-project
create-project:
    ## make create-project dir_name env=environment projectid=project_id
	@[ "${env}" ] || ( echo ">> var env is not set"; exit 1 )
	@[ "${projectid}" ] || ( echo ">> var projectid is not set"; exit 1 )
	mkdir $(call args) ; cp -r ./template-project/* $(call args)
	sed -i "s/{{.ENV}}/${env}/g" $(call args)/terraform.tfvars
	sed -i "s/{{.PROJECTID}}/${projectid}/g" $(call args)/terraform.tfvars

.PHONY: destroy
destroy:
	terraform -chdir=$(call args, production)/ plan  -destroy -var-file terraform.tfvars -out terraform.tfplan
	terraform -chdir=$(call args, production)/ apply  terraform.tfplan