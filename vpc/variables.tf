variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_id" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  type = list(string)
  default = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
}

variable "private_subnet_cidrs" {
  type = list(string)
  default = [ "10.0.4.0/24","10.0.5.0/24","10.0.6.0/24" ]
}