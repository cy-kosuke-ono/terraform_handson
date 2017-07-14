
CD = [ -d ./envs/${ENV} ] && cd ./envs/${ENV}

terraform:
	@${CD} && terraform get -update
	@${CD} && terraform ${ARGS}

terraform-plan:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform plan

terraform-apply:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform apply

terraform-show:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform state show ${ARGS}
