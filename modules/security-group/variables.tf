variable "name" {
  default     = ""
  description = "Name of resource."
}

variable "tags" {
  type        = map
  default     = {}
  description = "Setting tags for the feature"
}

variable "vpc_id" {
  default     = ""
  description = "VPC ID in which to create the Security Group"
}

variable "description" {
  default     = ""
  description = "Description of this Security Group"
}

variable "from_port" {
  default     = []
  description = "List port ingress rules"
}

variable "revoke_rules_on_delete" {
  default     = "false"
  description = " Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself."
}

variable "ingress_rules" {
  type        = any
  description = "list of ingress ports"
  default     = []
}

variable "egress_rules" {
  type        = any
  description = "list of egress ports"
  default     = []
}