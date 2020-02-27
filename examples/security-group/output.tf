output "security_group_id" {
  value       = module.security_group.security_group_id
  description = "ID of the security group."
}

output "security_group_arn" {
  value       = module.security_group.security_group_arn
  description = "ARN of the security group."
}

output "security_group_name" {
  value       = module.security_group.security_group_name
  description = "Name of the security group."
}
