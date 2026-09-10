locals {
  region   = "eu-west-2"
  vpc_cidr = "10.0.0.0/16"
  env      = "dev"

  azs            = ["eu-west-2a", "eu-west-2b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
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

