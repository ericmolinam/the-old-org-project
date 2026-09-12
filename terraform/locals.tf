locals {
  region   = "eu-west-2"
  vpc_cidr = "10.0.0.0/16"
  env      = "dev"
  public_subnets = {
    public_1 = {
      cidr_block        = cidrsubnet(local.vpc_cidr, 8, 1)
      availability_zone = "eu-west-2a"
    }
    public_2 = {
      cidr_block        = cidrsubnet(local.vpc_cidr, 8, 2)
      availability_zone = "eu-west-2b"
    }
  }

  private_subnets = {
    private_1 = {
      cidr_block        = cidrsubnet(local.vpc_cidr, 8, 101)
      availability_zone = "eu-west-2a"
    }
    private_2 = {
      cidr_block        = cidrsubnet(local.vpc_cidr, 8, 102)
      availability_zone = "eu-west-2b"
    }
  }

  ingress_rules = {
    ssh = {
      description = "Allow SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    http = {
      description = "Allow HTTP"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    https = {
      description = "Allow HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
