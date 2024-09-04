module "vpc" {
  source                        = "terraform-aws-modules/vpc/aws"
  version                       = "5.1.3"
  name                          = "vpc-serverless"
  cidr                          = "176.24.0.0/16"
  azs                           = ["us-west-1a", "us-west-1b", "us-west-1c"]
  private_subnets               = ["176.24.1.0/24", "176.24.3.0/24", "176.24.5.0/24"]
  public_subnets                = ["176.24.2.0/24", "176.24.4.0/24", "176.24.6.0/24"]
  enable_nat_gateway            = true
  single_nat_gateway            = true
  enable_dns_hostnames          = true
  manage_default_security_group = true
  default_security_group_name   = "vpc-serverless-security-group"

  public_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/elb"               = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
    "kubernetes.io/role/internal-elb"      = "1"
  }

  tags = {
    "kubernetes.io/cluster/vpc-serverless" = "shared"
  }

}
