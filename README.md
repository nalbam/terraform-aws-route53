# terraform-aws-route53

## usage

```
module "domain" {
  source = "github.com/nalbam/terraform-aws-route53"
  region = "us-east-1"

  domain = var.domain

  acm_certificate = true
}
```
