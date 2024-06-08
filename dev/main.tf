provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "../modules/vpc"
}

module "subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc.vpc_id
}

module "internet-gateway" {
  source = "../modules/internet-gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat-gateway-1" {
  source           = "../modules/nat-gateway"
  subnet_public_id = module.subnet.subnet_id_public_1
}

module "nat-gateway-2" {
  source           = "../modules/nat-gateway"
  subnet_public_id = module.subnet.subnet_id_public_2
}

module "route-table-1" {
  source            = "../modules/route-table"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.internet-gateway.igw_id
  subnet_public_id  = module.subnet.subnet_id_public_1
  subnet_private_id = module.subnet.subnet_id_private_1
  nat_gateway_id    = module.nat-gateway-1.nat_gateway_id
}

module "route-table-2" {
  source            = "../modules/route-table"
  vpc_id            = module.vpc.vpc_id
  igw_id            = module.internet-gateway.igw_id
  subnet_public_id  = module.subnet.subnet_id_public_2
  subnet_private_id = module.subnet.subnet_id_private_2
  nat_gateway_id    = module.nat-gateway-2.nat_gateway_id
}

module "security-group" {
  source         = "../modules/security-group"
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "alb" {
  source                        = "../modules/elb"
  vpc_id                        = module.vpc.vpc_id
  security_group_id_ingress_alb = module.security-group.security_group_id_ingress_alb
  subnet_id_public_1            = module.subnet.subnet_id_public_1
  subnet_id_public_2            = module.subnet.subnet_id_public_2
  instance_id_1                 = module.ec2-public-1.ec2_id
  instance_id_2                 = module.ec2-public-2.ec2_id
}

module "ec2-public-1" {
  source    = "../modules/ec2"
  subnet_id = module.subnet.subnet_id_public_1
  ec2_name  = "ec2-public-1"
}

module "ec2-public-2" {
  source    = "../modules/ec2"
  subnet_id = module.subnet.subnet_id_public_2
  ec2_name  = "ec2-public-2"
}

module "ec2-private-1" {
  source    = "../modules/ec2"
  subnet_id = module.subnet.subnet_id_private_1
  ec2_name  = "ec2-private-1"
}

module "ec2-private-2" {
  source    = "../modules/ec2"
  subnet_id = module.subnet.subnet_id_private_2
  ec2_name  = "ec2-private-2"
}
