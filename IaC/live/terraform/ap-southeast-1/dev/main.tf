module "vpc" {
  # source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/vpc?ref=v0.0.1"
  source = "../../../../modules/vpc"

  env    = terraform.workspace
  region = local.region
  zone1  = local.zone1
  zone2  = local.zone2
}

module "eks" {
  # source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/eks?ref=v0.0.1"
  source = "../../../../modules/eks"

  env              = terraform.workspace
  region           = local.region
  zone1            = local.zone1
  zone2            = local.zone2
  private_zone1_id = module.vpc.private_zone1_id
  private_zone2_id = module.vpc.private_zone2_id
}

# module "route53" {
#   source = "../../../../modules/route53"

#   env    = terraform.workspace
#   record_ips = ""
# }
