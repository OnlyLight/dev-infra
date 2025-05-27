variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
  default     = "onlylight.click"
}

variable "ingress_release_name" {
  description = "Ingress release name"
  type        = string
}

variable "env" {
  description = "The tag env name"
  type        = string
}
