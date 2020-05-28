# locals

locals {
  domain_name = var.domain_name == "" ? var.root_domain : var.domain_name
}

locals {
  certificate_arn = var.acm_certificate ? join("", aws_acm_certificate_validation.cert.*.certificate_arn) : join("", data.aws_acm_certificate.this.*.arn)
}
