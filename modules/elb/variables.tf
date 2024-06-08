variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_id_1" {
  description = "Instance ID 1"
  type        = string
}

variable "instance_id_2" {
  description = "Instance ID 2"
  type        = string
}

variable "security_group_id_ingress_alb" {
  description = "Security Group ID Ingress ALB"
  type        = string
}

variable "subnet_id_public_1" {
  description = "Subnet ID Public 1"
  type        = string
}

variable "subnet_id_public_2" {
  description = "Subnet ID Public 2"
  type        = string
}
