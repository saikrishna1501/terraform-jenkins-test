resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_id
  tags = {
    "Name" = "${var.env}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.env}-igw"
  }
}

# data "aws_availability_zones" "azs" {
#   all_availability_zones = true

#   filter {
#     name   = "opt-in-status"
#     values = ["not-opted-in", "opted-in"]
#   }
# }

resource "aws_subnet" "public_subnets" { //object
  for_each = {for index, item in var.public_subnet_cidrs: item => index} // {"10.0.1.0/24": 0, "10.0.2.0/24": 1}
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.key

  tags = {
    Name = "public-subnet-${each.value + 1}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "public-route"
  }
}

# resource "aws_route_table_association" "public_subnets_associations" {
#   for_each = toset([for key, value in aws_subnet.public_subnets: value])
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.public_route_table.id
# }

resource "aws_route_table_association" "public_subnets_associations" {
  for_each = toset(var.public_subnet_cidrs)
  subnet_id      = aws_subnet.public_subnets[each.value].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_subnet" "private_subnets" {
  for_each = {for index, item in var.private_subnet_cidrs: item => index} // {"10.0.1.0/24": 0, "10.0.2.0/24": 1}
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.key

  tags = {
    Name = "private-subnet-${each.value + 1}"
  }
}