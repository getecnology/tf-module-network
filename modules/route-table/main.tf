locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_route_table" "route" {
  vpc_id = var.vpc_id
  count  = var.az_count

  dynamic "route" {
    for_each = var.route_rules
    content {
      cidr_block                = route.value["cidr_block"]
      gateway_id                = route.value["gateway_id"]
      nat_gateway_id            = route.value["nat_gateway_id"]
      transit_gateway_id        = route.value["transit_gateway_id"]
      vpc_peering_connection_id = route.value["vpc_peering_connection_id"]
    }
  }

  tags = var.tags

}

resource "aws_route_table_association" "association" {
  count          = var.az_count
  subnet_id      = var.private_subnet_id[count.index]
  route_table_id = aws_route_table.route[count.index].id
}