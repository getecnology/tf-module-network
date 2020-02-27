output "elastic_ip_id" {
  value       = module.elastic_ip.elastic_ip_id
  description = "EIP allocation ID."
}

output "elastic_ip_public_ip" {
  value       = module.elastic_ip.elastic_ip_public_ip
  description = "Public IP address."
}

output "elastic_ip_private_ip" {
  value       = module.elastic_ip.elastic_ip_private_ip
  description = "Private IP address (if in VPC)."
}

output "data" {
  value       = data.aws_subnet_ids.private.ids
  description = "Private subnet IDs."
}