locals {
  name = var.env == "" ? "myapp" : var.env
}

module "vpc" {
  source = "../../modules/vpc"
  name = var.name_prefix
  cidr_block = var.cidr_block
  azs = var.azs
  tags = { Environment = var.env }
}

module "iam" {
  source = "../../modules/iam"
  name = var.name_prefix
}

module "alb" {
  source = "../../modules/alb"
  name = var.name_prefix
  public_subnets = module.vpc.public_subnets
  security_groups = []
  tags = { Environment = var.env }
}

module "ecs_cluster" {
  source = "../../modules/ecs"
  name = var.name_prefix
  cpu = 256
  memory = 512
  desired_count = var.ecs_desired_count
  subnets = module.vpc.private_subnets
  security_groups = []
  execution_role_arn = module.iam.execution_role_arn
  container_definitions = ""
  container_name = "app"
  container_port = 80
  target_group_arn = ""
}

module "rds" {
  source = "../../modules/rds"
  name = var.name_prefix
  instance_class = var.db_instance_class
  username = "appuser"
  password = "please_change_me"
  multi_az = true
}

module "redis" {
  source = "../../modules/redis"
  name = var.name_prefix
  cluster_enabled = true
}
