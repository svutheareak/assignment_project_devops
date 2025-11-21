# Terraform Infra Template (ECS Fargate + ALB + RDS + Redis)

This repo contains a production-friendly Terraform layout with modules and environment folders (dev/uat/prod),
a Makefile for local operations, and a sample GitLab CI pipeline.

**What is included**
- `modules/*` modular Terraform code (stubs / templates)
- `env/{dev,uat,prod}` environment folders referencing modules
- `Makefile` for init/plan/apply/destroy/rollback
- `backend.tf` examples (use your own S3 bucket & DynamoDB)
- `.gitlab-ci.yml` sample pipeline (for GitLab CI)
- Exported as a zip for download.

> IMPORTANT: These are templates and minimal working examples. Review and adapt variables,
backend buckets, and provider configuration before running `terraform apply`.

