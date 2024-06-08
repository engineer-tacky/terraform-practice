output "security_group_id_ingress_allow_all" {
  value = aws_vpc_security_group_ingress_rule.allow_all.security_group_id
}

output "security_group_id_ingress_alb" {
  value = aws_vpc_security_group_ingress_rule.alb.security_group_id
}

output "security_group_id_egress" {
  value = aws_vpc_security_group_egress_rule.allow_all.security_group_id
}
