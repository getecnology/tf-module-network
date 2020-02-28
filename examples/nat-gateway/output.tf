output "nat_gateway_id" {
  value       = module.nat_gateway.nat_gateway_id
  description = "ID of the NAT Gateway."
}
output "nat_gateway_public_ip" {
  value       = module.nat_gateway.nat_gateway_public_ip
  description = "Public IP address of the NAT Gateway."
}
output "nat_gateway_private_ip" {
  value       = module.nat_gateway.nat_gateway_private_ip
  description = "Private IP address of the NAT Gateway."
}