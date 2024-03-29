# tf-module-security-group
A security group acts as a virtual firewall for your instance to control inbound and outbound traffic.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| description | Description of this Security Group | `string` | `""` | no |
| egress\_rules | list of egress ports | `any` | `[]` | no |
| from\_port | List port ingress rules | `list` | `[]` | no |
| ingress\_rules | list of ingress ports | `any` | `[]` | no |
| name | Name of resource. | `string` | `""` | no |
| revoke\_rules\_on\_delete | Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself. | `string` | `"false"` | no |
| tags | Setting tags for the feature | `map` | `{}` | no |
| vpc\_id | VPC ID in which to create the Security Group | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| security\_group\_arn | ARN of the security group. |
| security\_group\_id | ID of the security group. |
| security\_group\_name | Name of the security group. |

