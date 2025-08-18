module "vpc" {
  # source = "git@github-win:OnlyLight/dev-infra.git//IaC/modules/vpc?ref=v0.0.1"
  source = "../../../../modules/vpc"

  env    = terraform.workspace
  region = local.region
  zone1  = local.zone1
  zone2  = local.zone2
}
