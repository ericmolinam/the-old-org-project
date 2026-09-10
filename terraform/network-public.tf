resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.env}-igw"
  }
}

resource "aws_subnet" "public_1" {
  count = length(local.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnets[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${local.env}-public-${local.azs[count.index]}"
  }
}

resource "aws_subnet" "public_2" {
  count = length(local.public_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = local.public_subnets[count.index]
  availability_zone = local.azs[count.index]

  tags = {
    Name = "${local.env}-public-${local.azs[count.index]}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${local.env}-public"
  }
}

resource "aws_route_table_association" "public_1" {
  count = length(local.public_subnets)

  subnet_id      = aws_subnet.public_1[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  count = length(local.public_subnets)

  subnet_id      = aws_subnet.public_2[count.index].id
  route_table_id = aws_route_table.public.id
}