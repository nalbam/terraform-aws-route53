# terraform-aws-route53

## usage

```
module "domain" {
  source = "github.com/nalbam/terraform-aws-route53"

  region = "${var.region}"

  domain = "nalbam.com"
}
```
