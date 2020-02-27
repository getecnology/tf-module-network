output "elastic_ip_id" {
  value       = aws_eip.eip.*.id
  description = " EIP allocation ID"
}

output "elastic_ip_public_ip" {
  value       = aws_eip.eip.*.public_ip
  description = "Public IP address."
}

output "elastic_ip_private_ip" {
  value       = aws_eip.eip.*.private_ip
  description = "Private IP address (if in VPC)."
}