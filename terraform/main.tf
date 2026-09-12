resource "aws_vpc" "this" {
  cidr_block = local.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.env}-vpc"
  }
}
resource "aws_instance" "this" {
  for_each = local.public_subnets

  ami           = "ami-0f9629c639a701fa7"
  instance_type = "t3.micro"

  vpc_security_group_ids = [aws_security_group.public.id]
  subnet_id = aws_subnet.public[each.key].id

  tags = {
    Name = "${local.env}-instance-${each.key}"
  }
}
