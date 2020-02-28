variable "name" {
  default     = ""
  description = "Launch Template name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Setting tags for the feature"
}

variable "subnet_count" {
  default     = ""
  description = "Total subnets."
}

variable "allocation_id" {
  type        = any
  default     = ""
  description = "The Allocation ID of the Elastic IP address for the gateway."
}

variable "private_subnet_id" {
  type        = any
  default     = ""
  description = "The Subnet ID of the subnet in which to place the gateway."
}