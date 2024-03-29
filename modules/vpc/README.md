# tf-module-vpc
 Provision a logically isolated section of the AWS Cloud where you can launch AWS resources in a virtual network that you define

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.40 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cidr\_block | The CIDR block for the VPC | `string` | `""` | no |
| enable\_classiclink\_dns\_support | A boolean flag to enable/disable ClassicLink DNS Support for the VPC. | `string` | `"false"` | no |
| enable\_dns\_hostnames | A boolean flag to enable/disable DNS hostnames in the VPC. | `string` | `"false"` | no |
| enable\_dns\_support | A boolean flag to enable/disable DNS support in the VPC. | `string` | `"true"` | no |
| instance\_tenancy | A tenancy option for instances launched into the VPC, can be: default, host or dedicated, for more information: https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/dedicated-instance.html | `string` | `"default"` | no |
| name | Launch Template name. | `string` | `""` | no |
| tags | Setting tags for the feature | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_arn | ARN of VPC. |
| vpc\_cidr\_block | CIDR block of the VPC. |
| vpc\_id | ID of the VPC. |