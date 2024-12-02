module "vpc" {
  source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/vpc?ref=v0.0.1"

  env = "prod"
}

module "eks" {
  source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/eks?ref=v0.0.1"

  env = "prod"
  private_zone1_id = module.vpc.private_zone1_id
  private_zone2_id = module.vpc.private_zone2_id
}
