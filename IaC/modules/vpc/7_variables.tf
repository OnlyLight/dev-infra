variable "env" {
  description = "The tag env name"
  type        = string
}

variable "eks_name" {
  description = "The EKS name"
  type        = string
  default     = "eks-t"
}

variable "vpc_list_cidr" {
  type = object({
    vpc_cidr = string
    vpc_cidr_subnet_private_zone1 = string
    vpc_cidr_subnet_private_zone2 = string
    vpc_cidr_subnet_public_zone1  = string
    vpc_cidr_subnet_public_zone2  = string
  })
  default = {
    vpc_cidr                      = "10.0.0.0/16"
    vpc_cidr_subnet_private_zone1 = "10.0.0.0/19"
    vpc_cidr_subnet_private_zone2 = "10.0.32.0/19"
    vpc_cidr_subnet_public_zone1  = "10.0.64.0/19"
    vpc_cidr_subnet_public_zone2  = "10.0.96.0/19"
  }
}
