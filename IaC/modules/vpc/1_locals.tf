locals {
  region = var.region
  zone1  = var.zone1
  zone2  = var.zone2

  vpc_cidr                      = "10.0.0.0/16"
  vpc_cidr_subnet_private_zone1 = "10.0.0.0/19"
  vpc_cidr_subnet_private_zone2 = "10.0.32.0/19"
  vpc_cidr_subnet_public_zone1  = "10.0.64.0/19"
  vpc_cidr_subnet_public_zone2  = "10.0.96.0/19"
}
