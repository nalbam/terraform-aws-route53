# output

output "zone_id" {
  value = data.aws_route53_zone.this.id
}

output "name" {
  value = data.aws_route53_zone.this.name
}

output "certificate_arn" {
  value = local.certificate_arn
  # value = aws_acm_certificate_validation.cert.0.certificate_arn
  # value = join("", aws_acm_certificate_validation.cert.*.certificate_arn)
}
