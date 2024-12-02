module "vpc" {
  source = "../modules/vpc"

  env = "dev"
}

module "eks" {
  source = "../modules/eks"

  env = "dev"
  private_zone1_id = module.vpc.private_zone1_id
  private_zone2_id = module.vpc.private_zone2_id
}
