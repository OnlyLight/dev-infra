variable "domain_name" {
  description = "Domain name for the hosted zone"
  type        = string
}

variable "record_ips" {
  description = "Record IPs"
  type        = list(string)
}
