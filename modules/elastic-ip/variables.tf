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