resource "aws_security_group" "main_security_group" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_all" {
  security_group_id = aws_security_group.main_security_group.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb" {
  security_group_id = aws_security_group.main_security_group.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = var.vpc_cidr_block
}

resource "aws_vpc_security_group_egress_rule" "allow_all" {
  security_group_id = aws_security_group.main_security_group.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}
