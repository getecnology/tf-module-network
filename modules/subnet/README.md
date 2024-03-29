# tf-module-subnet 
This module sets up subnets in an AWS VPC.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| az\_count | n/a | `string` | `""` | no |
| cidr\_block | The CIDR block for the subnet. | `string` | `""` | no |
| environment | n/a | `string` | `""` | no |
| map\_public\_ip\_on\_launch | Specify true to indicate that instances launched into the subnet should be assigned a public IP address. | `string` | `"false"` | no |
| name | Launch Template name. | `string` | `""` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zones\_ids | List of the Availability Zone IDs available to the account. |
| availability\_zones\_names | List of the Availability Zone names available to the account. |
| private\_subnet\_arn | ARN of the subnet. |
| private\_subnet\_id | ID of the subnet. |