module "vpc" {
source = "./modules/vpc"

vpc_cidr_block = var.vpc_cidr_block
enable_dns_hostnames = true
enable_dns_support = true
cidr_block_public1 = var.cidr_block_public1 
cidr_block_public2 = var.cidr_block_public2
cidr_block_private1 = var.cidr_block_private1
cidr_block_private2 = var.cidr_block_private2
az_1 = var.az_1
az_2 = var.az_2
route_table_cidr_block = var.route_table_cidr_block
}

module "iam" {
    source = "./modules/iam"

    attached_policy_arn = var.attached_policy_arn
  
}

module "security_groups" {
  source = "./modules/security_groups"

http_port = var.http_port
https_port = var.https_port
vpc_id = module.vpc.vpc_id
sg_cidr = var.sg_cidr
container_port = var.container_port
}

module "alb" {
  source = "./modules/alb"

  container_port = var.container_port
  vpc_id = module.vpc.vpc_id
  alb_sg_id = module.security_groups.alb_sg_id
  public_subnet1_id = module.vpc.public_subnet1_id
  public_subnet2_id = module.vpc.public_subnet2_id
  ssl_policy = var.ssl_policy
  certificate_arn = module.acm.certificate_arn
}

module "route53" {
  source = "./modules/route53"
  hosted_zone_domain = var.hosted_zone_domain
  ecs_subdomain = var.ecs_subdomain
  alb_dns_name = module.alb.dns_name
  alb_zone_id = module.alb.zone_id
}

module "acm" {
  source = "./modules/acm"
  ecs_subdomain = var.ecs_subdomain
  validation_method = var.validation_method
  hosted_zone_domain = var.hosted_zone_domain
}

module "ecs" {
  source = "./modules/ecs"
task_family = var.task_family
network_mode = var.network_mode
execution_role_arn = var.execution_role_arn
container_name = var.container_name
container_image = var.container_image
cpu = var.cpu
memory = var.memory
container_port = var.container_port
logdriver = var.logdriver
logs_group = var.logs_group
stream_prefix = var.stream_prefix
ecs_sg_id = module.security_groups.ecs_sg_id
private_subnets_id = module.vpc.private_subnets
target_group_arn = module.alb.alb_tg
}