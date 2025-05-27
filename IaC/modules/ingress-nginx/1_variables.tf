# Input variables
variable "eks_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

variable "eks_ca_certificate" {
  description = "EKS cluster CA certificate"
  type        = string
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "env" {
  description = "The tag env name"
  type        = string
}
