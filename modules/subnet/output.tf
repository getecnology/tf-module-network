output "private_subnet_id" {
  value       = aws_subnet.subnet.*.id
  description = "ID of the subnet."
}

output "private_subnet_arn" {
  value       = aws_subnet.subnet.*.arn
  description = "ARN of the subnet."
}

output "availability_zones_names" {
  value       = data.aws_availability_zones.available.*.names
  description = "List of the Availability Zone names available to the account."
}

output "availability_zones_ids" {
  value       = data.aws_availability_zones.available.*.zone_ids
  description = "List of the Availability Zone IDs available to the account. "
}