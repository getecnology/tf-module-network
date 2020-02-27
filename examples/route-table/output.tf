output "route_table_id" {
  value       = module.private_subnet.route_table_id
  description = "ID of the routing table. "
}