resource "aws_instance" "main_ec2" {
  ami           = "ami-0b9a26d37416470d2"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id

  tags = {
    Name = var.ec2_name
  }
}
