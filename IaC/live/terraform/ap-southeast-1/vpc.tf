module "vpc" {
  # source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/vpc?ref=v0.0.1"
  source = "../../../../modules/vpc"

  env                           = terraform.workspace
  region                        = local.region
  zone1                         = local.zone1
  zone2                         = local.zone2
  vpc_cidr                      = vpc_list_cidr.vpc_cidr
  vpc_cidr_subnet_private_zone1 = vpc_list_cidr.vpc_cidr_subnet_private_zone1
  vpc_cidr_subnet_private_zone2 = vpc_list_cidr.vpc_cidr_subnet_private_zone2
  vpc_cidr_subnet_public_zone1  = vpc_list_cidr.vpc_cidr_subnet_public_zone1
  vpc_cidr_subnet_public_zone2  = vpc_list_cidr.vpc_cidr_subnet_public_zone2
}
