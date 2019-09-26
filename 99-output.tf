# output

output "zone_id" {
  value = data.aws_route53_zone.this.id
}

output "name" {
  value = data.aws_route53_zone.this.name
}

output "certificate_id" {
  value = var.acm_certificate ? aws_acm_certificate.cert[0].id : data.aws_acm_certificate.this[0].id
}

output "certificate_arn" {
  value = var.acm_certificate ? data.aws_acm_certificate.cert[0].arn : data.aws_acm_certificate.this[0].arn
}
