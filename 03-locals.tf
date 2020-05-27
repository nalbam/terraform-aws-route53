# locals

locals {
  domain_name = var.domain_name == "" ? var.root_domain : var.domain_name
}

# locals {
#   certificate_arn = var.acm_certificate ? aws_acm_certificate_validation.cert.0.certificate_arn : data.aws_acm_certificate.this.0.arn
# }
