module "eks-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.24.0"
  cluster_name    = "eks-serverless"
  cluster_version = "1.30"

  vpc_id = module.vpc.outputs.vpc_id

  // Fargate profiles here
  fargate_profiles = {
    eks_cluster_name = "eks-fargate-cluster"
    subnets          = [module.vpc.outputs.public_subnets, module.vpc.outputs.private_subnets]
  }
}
