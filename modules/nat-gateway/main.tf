resource "aws_eip" "nat_gateway_eip" {
  domain = "vpc"

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = var.subnet_public_id
}
