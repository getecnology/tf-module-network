output "private_subnet_id" {
  value       = module.private_subnet.private_subnet_id
  description = "ID of the subnet."
}

output "private_subnet_arn" {
  value       = module.private_subnet.private_subnet_arn
  description = "ARN of the subnet."
}