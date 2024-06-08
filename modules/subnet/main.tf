resource "aws_subnet" "main_subnet_public_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-northeast-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet-public-1"
  }
}

resource "aws_subnet" "main_subnet_public_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "main-subnet-public-2"
  }
}

resource "aws_subnet" "main_subnet_private_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "main-subnet-private-1"
  }
}

resource "aws_subnet" "main_subnet_private_2" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "main-subnet-private-2"
  }
}
