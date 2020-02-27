output "route_table_id" {
  value       = aws_route_table.route.*.id
  description = "ID of the routing table."
}

