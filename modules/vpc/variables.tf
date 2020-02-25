
variable "name" {
  default     = ""
  description = "Launch Template name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Setting tags for the feature"
}

variable "cidr_block" {
  default     = ""
  description = "The CIDR block for the VPC"
}

variable "instance_tenancy" {
  default     = "default"
  description = "A tenancy option for instances launched into the VPC, can be: default, host or dedicated, for more information: https://docs.aws.amazon.com/pt_br/AWSEC2/latest/UserGuide/dedicated-instance.html"
}

variable "enable_dns_support" {
  default     = "true"
  description = "A boolean flag to enable/disable DNS support in the VPC."
}

variable "enable_dns_hostnames" {
  default     = "false"
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
}

variable "enable_classiclink_dns_support" {
  default     = "false"
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC."
}