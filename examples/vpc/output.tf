output "private_subnet_id" {
  value       = module.private_subnet.private_subnet_id
  description = "ID of the VPC."
}

output "private_subnet_arn" {
  value       = module.private_subnet.private_subnet_arn
  description = "ARN of VPC."
}