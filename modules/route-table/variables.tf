variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "igw_id" {
  description = "Internet Gateway ID"
  type        = string
}

variable "subnet_public_id" {
  description = "Subnet Public ID"
  type        = string
}

variable "subnet_private_id" {
  description = "Subnet Private ID"
  type        = string
}

variable "nat_gateway_id" {
  description = "NAT Gateway ID"
  type        = string
}
