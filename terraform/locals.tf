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
}

