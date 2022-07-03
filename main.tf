module "vpc" {
  source = "./vpc"
  env = var.env
  region = var.region
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public_subnets_ids" {
  value = module.vpc.public_subnets_ids
}

output "public_subnets_cidrs" {
  value = module.vpc.public_subnets_cidrs
}
output "private_subnets_ids" {
  value = module.vpc.private_subnets_ids
}

output "private_subnets_cidrs" {
  value = module.vpc.private_subnets_cidrs
}