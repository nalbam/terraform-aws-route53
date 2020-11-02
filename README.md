# terraform-aws-route53

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acm\_certificate | n/a | `bool` | `false` | no |
| domain\_name | n/a | `string` | `""` | no |
| region | The region to deploy the cluster in, e.g: us-east-1 | `string` | `"us-east-1"` | no |
| root\_domain | The Hosted Zone name of the desired Hosted Zone. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| certificate\_arn | n/a |
| name | n/a |
| zone\_id | n/a |
