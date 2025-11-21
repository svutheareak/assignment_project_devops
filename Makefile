ENV ?= dev
TF_DIR=infra/env/$(ENV)

init:
	cd $(TF_DIR) && terraform init

plan:
	cd $(TF_DIR) && terraform plan -var-file=terraform.tfvars

apply:
	cd $(TF_DIR) && terraform apply -var-file=terraform.tfvars -auto-approve

destroy:
	cd $(TF_DIR) && terraform destroy -var-file=terraform.tfvars -auto-approve

rollback:
	@echo "Running refresh-only apply to reconcile state (safe rollback attempt)"
	cd $(TF_DIR) && terraform apply -refresh-only -auto-approve

protect-prod:
ifeq ($(ENV),prod)
	@echo "⚠️  WARNING: You are deploying to PRODUCTION!"
	@echo "Type YES to continue:"
	read CONFIRM && [ "$$CONFIRM" = "YES" ]
endif

deploy: protect-prod init plan apply
	@echo "🚀 Deploy complete to $(ENV)"

manual:
	@echo "Select environment: dev / uat / prod"
	@read USER_ENV && $(MAKE) deploy ENV=$$USER_ENV
