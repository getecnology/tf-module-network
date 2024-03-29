# tf-module-nat-gateway
You can use a network address translation (NAT) gateway to enable instances in a private subnet to connect to the internet or other AWS services, but prevent the internet from initiating a connection with those instances. 

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| allocation\_id | The Allocation ID of the Elastic IP address for the gateway. | `any` | `""` | no |
| name | Launch Template name. | `string` | `""` | no |
| private\_subnet\_id | The Subnet ID of the subnet in which to place the gateway. | `any` | `""` | no |
| subnet\_count | Total subnets. | `string` | `""` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| nat\_gateway\_id | ID of the NAT Gateway. |
| nat\_gateway\_private\_ip | The private IP address of the NAT Gateway. |
| nat\_gateway\_public\_ip | The public IP address of the NAT Gateway. |

