# locals

locals {
  domain_name = var.domain_name == "" ? var.root_domain : var.domain_name
}

locals {
  certificate_arn = var.acm_certificate ? element(concat(aws_acm_certificate.cert.*.arn, [""]), 0) : element(concat(data.aws_acm_certificate.this.*.arn, [""]), 0)

  certificate_fqdn = var.acm_certificate ? element(concat(aws_route53_record.cert.*.fqdn, [""]), 0) : element(concat(data.aws_route53_record.this.*.fqdn, [""]), 0)
}
