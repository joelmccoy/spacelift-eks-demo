module "eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.24.0"
  cluster_name    = "eks-serverless"
  cluster_version = "1.30"

  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  // Fargate profiles here
  fargate_profiles = {
    fargate_profile_1 = {
      name     = "fargate-profile"
      subnets  = module.vpc.public_subnets
      selectors = [
        {
          namespace = "default"
          labels = {
            environment = "dev"
          }
        }
      ]
    }
  }
}
