resource "aws_subnet" "private_zone1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.vpc_list_cidr.vpc_cidr_subnet_private_zone1
  availability_zone = local.zone1

  tags = {
    "Name"                                                 = "${var.env}-private-${local.zone1}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"   = "owned" # fully owned and managed by the Kubernetes cluster
  }
}

resource "aws_subnet" "private_zone2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.vpc_list_cidr.vpc_cidr_subnet_private_zone2
  availability_zone = local.zone2

  tags = {
    "Name"                                                 = "${var.env}-private-${local.zone2}"
    "kubernetes.io/role/internal-elb"                      = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"   = "owned"
  }
}

resource "aws_subnet" "public_zone1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.vpc_list_cidr.vpc_cidr_subnet_public_zone1
  availability_zone       = local.zone1
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${var.env}-public-${local.zone1}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"   = "owned"
  }
}

resource "aws_subnet" "public_zone2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.vpc_list_cidr.vpc_cidr_subnet_public_zone2
  availability_zone       = local.zone2
  map_public_ip_on_launch = true

  tags = {
    "Name"                                                 = "${var.env}-public-${local.zone2}"
    "kubernetes.io/role/elb"                               = "1"
    "kubernetes.io/cluster/${var.env}-${var.eks_name}"   = "owned"
  }
}
