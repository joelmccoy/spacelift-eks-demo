module "eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.24.0"
  cluster_name    = "eks-serverless"
  cluster_version = "1.30"

  vpc_id = module.vpc.outputs.vpc_id

  // Fargate profiles here
  fargate_profiles = {
    fargate_profile_1 = {
      name     = "fargate-profile"
      subnets  = module.vpc.private_subnets
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
