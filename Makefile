# Makefile

CD = [ -d ./envs/${ENV} ] && cd ./envs/${ENV}

plan:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform plan

apply:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform apply

show:
	@${CD} && terraform init
	@${CD} && terraform get -update
	@${CD} && terraform state show ${ARGS}

docker-build:
	docker build -t cybird/terraform:0.9.11 .

docker-tfplan:
	docker run --env-file env.list \
		-i -v ${PWD}:/data cybird/terraform:0.9.11 plan ENV=${ENV}

docker-tfapply:
	docker run --env-file env.list \
		-i -v ${PWD}:/data cybird/terraform:0.9.11 apply ENV=${ENV}

docker-tfshow:
	docker run --env-file env.list \
		-i -v ${PWD}:/data cybird/terraform:0.9.11 show ENV=${ENV} ARGS=${ARGS}
