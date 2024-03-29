# tf-module-route-table
A route table contains a set of rules, called routes, which are used to determine where network traffic from your subnet or gateway is directed, this module allows us to configure route tables.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| az\_count | n/a | `string` | `""` | no |
| name | Launch Template name. | `string` | `""` | no |
| private\_subnet\_id | The subnet ID to create an association. Conflicts with gateway\_id. | `string` | `""` | no |
| route\_rules | Rules of route table. | `list` | `[]` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| route\_table\_id | ID of the routing table. |

