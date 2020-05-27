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

  name = aws_acm_certificate.cert.0.domain_validation_options.0.resource_record_name
  type = aws_acm_certificate.cert.0.domain_validation_options.0.resource_record_type
  ttl  = 60

  records = [
    aws_acm_certificate.cert.0.domain_validation_options.0.resource_record_value,
  ]
}

resource "aws_acm_certificate_validation" "cert" {
  count = var.acm_certificate ? length(aws_route53_record.cert) == 1 ? 1 : 0 : 0

  certificate_arn = local.certificate_arn

  validation_record_fqdns = [
    aws_route53_record.cert.0.fqdn,
  ]
}
