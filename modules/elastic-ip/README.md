# tf-module-elastic-ip
An elastic IP address is a static IPv4 address designed for dynamic cloud computing, this module allows us to configure an elastic ip and associate it with our vpc.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| name | Launch Template name. | `string` | `""` | no |
| subnet\_count | Total subnets. | `string` | `""` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| elastic\_ip\_id | EIP allocation ID |
| elastic\_ip\_private\_ip | Private IP address (if in VPC). |
| elastic\_ip\_public\_ip | Public IP address. |

