# output

output "zone_id" {
  value = data.aws_route53_zone.this.id
}

output "name" {
  value = data.aws_route53_zone.this.name
}

output "certificate_id" {
  value = data.aws_acm_certificate.this.id
}

output "certificate_arn" {
  value = data.aws_acm_certificate.this.arn
}
