resource "aws_route_table" "main_rt_public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main-rt-public"
  }
}

resource "aws_route_table" "main_rt_private" {
  vpc_id = var.vpc_id

  tags = {
    Name = "main-rt-private"
  }
}

resource "aws_route" "main_rt_public_igw" {
  route_table_id         = aws_route_table.main_rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.igw_id
}

resource "aws_route" "main_rt_private" {
  route_table_id         = aws_route_table.main_rt_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = var.nat_gateway_id
}

resource "aws_route_table_association" "main_rt_public_association" {
  subnet_id      = var.subnet_public_id
  route_table_id = aws_route_table.main_rt_public.id
}

resource "aws_route_table_association" "main_rt_private_association" {
  subnet_id      = var.subnet_private_id
  route_table_id = aws_route_table.main_rt_private.id
}
