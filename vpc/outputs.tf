output "vpc_id" {
  description = "id of the vpc"
  value = aws_vpc.vpc.id 
}

output "vpc_cidr" {
  description = "cidr of the vpc"
  value = aws_vpc.vpc.cidr_block 
}

output "public_subnets_ids" {
  description = "list of public subnet ids"
  value = [for key,value in aws_subnet.public_subnets: value.id]
}

output "public_subnets_cidrs" {
  description = "list of public subnet ids"
  value = var.public_subnet_cidrs
}

output "private_subnets_ids" {
  description = "list of private subnet ids"
  value = [for key,value in aws_subnet.private_subnets: value.id]
}

output "private_subnets_cidrs" {
  description = "list of public subnet ids"
  value = var.private_subnet_cidrs
}