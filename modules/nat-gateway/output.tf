output "nat_gateway_id" {
  value       = aws_nat_gateway.ngw.*.id
  description = "ID of the NAT Gateway."
}

output "nat_gateway_public_ip" {
  value       = aws_nat_gateway.ngw.*.public_ip
  description = "The public IP address of the NAT Gateway."
}

output "nat_gateway_private_ip" {
  value       = aws_nat_gateway.ngw.*.private_ip
  description = "The private IP address of the NAT Gateway."
}
