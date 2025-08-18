variable "vpc_list_cidr" {
  type = object({
    vpc_cidr                      = string
    vpc_cidr_subnet_private_zone1 = string
    vpc_cidr_subnet_private_zone2 = string
    vpc_cidr_subnet_public_zone1  = string
    vpc_cidr_subnet_public_zone2  = string
  })
}
