output "security_group_id" {
  value       = "${join(",", aws_security_group.security_group.*.id)}"
  description = "ID of the security group."
}

output "security_group_arn" {
  value       = "${join(",", aws_security_group.security_group.*.arn)}"
  description = "ARN of the security group."
}

output "security_group_name" {
  value       = "${join(",", aws_security_group.security_group.*.name)}"
  description = "Name of the security group."
}

