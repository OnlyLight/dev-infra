variable "eks_name" {
  description = "The EKS name"
  type        = string
  default     = "eks-t"
}

variable "eks_version" {
  description = "The EKS version"
  type        = string
  default     = "1.31"
}

variable "env" {
  description = "The tag env name"
  type        = string
}

variable "instance_types" {
  description = "List instance_type"
  type        = list(string)
  default     = ["t2.medium"]
}

variable "scaling_config" {
  type = object({
    desired_size = number
    max_size     = number
    min_size     = number
  })
  default = {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }
}

variable "private_zone1_id" {
  description = "The id private zone 1"
  type        = string
}

variable "private_zone2_id" {
  description = "The id private zone 2"
  type        = string
}
