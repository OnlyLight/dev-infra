locals {
  region = "ap-southeast-1"
  zone1  = "ap-southeast-1a"
  zone2  = "ap-southeast-1b"

  env         = "test"
  vpc_name    = "vpc-t"
  eks_name    = "eks-t"
  eks_version = "1.31"

  vpc_cidr                      = "10.0.0.0/16"
  vpc_cidr_subnet_private_zone1 = "10.0.0.0/19"
  vpc_cidr_subnet_private_zone2 = "10.0.32.0/19"
  vpc_cidr_subnet_public_zone1  = "10.0.64.0/19"
  vpc_cidr_subnet_public_zone2  = "10.0.96.0/19"
}
