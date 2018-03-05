output "route53_zone_id" {
  value = "${data.aws_route53_zone.default.id}"
}

output "acm_certificate_arn" {
  value = "${data.aws_acm_certificate.default.arn}"
}
