variable "name" {
  default     = ""
  description = "Launch Template name."
}

variable "environment" {
  default = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Setting tags for the feature"
}

variable "vpc_id" {
  default     = ""
  description = "The VPC ID."
}

variable "cidr_block" {
  default     = ""
  description = "The CIDR block for the subnet."
}

variable "map_public_ip_on_launch" {
  default     = "false"
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address."
}

variable "az_count" {
  default = ""
}