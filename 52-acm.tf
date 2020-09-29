# acm

resource "aws_acm_certificate" "cert" {
  count = var.acm_certificate ? 1 : 0

  domain_name = local.domain_name

  subject_alternative_names = [
    "*.${local.domain_name}"
  ]

  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert" {
  count = var.acm_certificate ? 1 : 0

  zone_id = data.aws_route53_zone.this.id
  name    = element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_name, [""]), 0)
  type    = element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_type, [""]), 0)
  ttl     = 300

  records = [
    element(concat(aws_acm_certificate.cert.0.domain_validation_options.*.resource_record_value, [""]), 0),
  ]
}

resource "aws_acm_certificate_validation" "cert" {
  count = var.acm_certificate ? length(aws_acm_certificate.cert) == 1 ? length(aws_route53_record.cert) == 1 ? 1 : 0 : 0 : 0

  certificate_arn = aws_acm_certificate.cert.0.arn

  validation_record_fqdns = [
    aws_route53_record.cert.0.fqdn,
  ]
}
