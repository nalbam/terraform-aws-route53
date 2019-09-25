# route53

data "aws_route53_zone" "this" {
  name = var.domain
}

data "aws_acm_certificate" "this" {
  domain = var.domain
  statuses = [
    "ISSUED",
  ]
  most_recent = true
}
