/* For more details on the configuration, visit the official documentation::
https://www.terraform.io/docs/providers/aws/r/security_group.html
 */

locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_security_group" "security_group" {

  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  revoke_rules_on_delete = var.revoke_rules_on_delete

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      security_groups  = ingress.value.security_groups
      self             = ingress.value.self
      prefix_list_ids  = ingress.value.prefix_list_ids
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks

    }
  }

  dynamic "egress" {
    for_each = var.egress_rules

    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      security_groups  = egress.value.security_groups
      self             = egress.value.self
      prefix_list_ids  = egress.value.prefix_list_ids
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }

  tags = var.tags
}