
provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {}

module "vpc" {
  source               = "./modules/vpc"
  name                 = var.name
  cidr_block           = var.vpc_cidr_block
  public_subnet_count  = var.public_subnet_count
  availability_zones   = data.aws_availability_zones.available.names
  tags                 = var.tags
}

module "iam" {
  source               = "./modules/iam"
  name                 = var.name
  environment_file_arn = var.environment_file_arn
  tags                 = var.tags
}

module "alb" {
  source                  = "./modules/alb"
  name                    = var.name
  vpc_id                  = module.vpc.vpc_id
  subnet_ids              = module.vpc.public_subnet_ids
  listener_port           = var.listener_port
  target_port             = var.container_port
  health_check_path       = var.health_check_path
  health_check_interval   = var.health_check_interval
  health_check_timeout    = var.health_check_timeout
  healthy_threshold       = var.healthy_threshold
  unhealthy_threshold     = var.unhealthy_threshold
  health_check_matcher    = var.health_check_matcher
  tags                    = var.tags
}

module "ecs_cluster" {
  source = "./modules/ecs_cluster"
  name   = var.name
  tags   = var.tags
}

module "ecs_service" {
  source               = "./modules/ecs_service"
  name                 = var.name
  cluster_id           = module.ecs_cluster.cluster_id
  execution_role_arn   = module.iam.execution_role_arn
  container_name       = var.container_name
  image                = var.image
  container_port       = var.container_port
  cpu                  = var.cpu
  memory               = var.memory
  desired_count        = var.desired_count
  subnet_ids           = module.vpc.public_subnet_ids
  security_group_id    = module.alb.security_group_id
  target_group_arn     = module.alb.target_group_arn
  alb_listener_arn     = module.alb.listener_arn
  environment_file_arn = var.environment_file_arn
  log_group_name       = var.log_group_name
  log_retention_in_days = var.log_retention_in_days
  region               = var.region
  tags                 = var.tags
}
