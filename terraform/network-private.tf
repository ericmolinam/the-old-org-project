resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "dev-ip"
  }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = aws_subnet.public_1.id

  tags = {
    Name = "dev-nat"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_subnet" "private_1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.101.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "dev-private-eu-west-2a"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.102.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "dev-private-eu-west-2b"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "dev-private"
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_2" {
  subnet_id      = aws_subnet.private_2.id
  route_table_id = aws_route_table.private.id
}
