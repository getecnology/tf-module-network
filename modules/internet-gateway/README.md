# tf-module-internet-gateway
An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between instances in your VPC and the internet.

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| name | Launch Template name. | `string` | `""` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |
| vpc\_id | The VPC ID. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| internet\_gateway\_id | ID of the Internet Gateway. |