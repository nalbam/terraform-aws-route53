# variable

variable "region" {
  description = "The region to deploy the cluster in, e.g: us-east-1"
  default     = "us-east-1"
}

variable "root_domain" {
  description = "The Hosted Zone name of the desired Hosted Zone."
}

variable "domain_name" {
  default = ""
}

variable "acm_certificate" {
  default = false
}
