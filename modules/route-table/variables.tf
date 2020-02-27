variable "name" {
  default     = ""
  description = "Launch Template name."
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

variable "route_rules" {
  default     = []
  description = "Rules of route table."
}

variable "az_count" {
  default = ""
}

variable "private_subnet_id" {
  default     = ""
  description = "The subnet ID to create an association. Conflicts with gateway_id."
}