/* For more details on the configuration, visit the official documentation:
https://www.terraform.io/docs/providers/aws/r/vpc.html */

locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_vpc" "vpc" {
  cidr_block                     = var.cidr_block
  instance_tenancy               = var.instance_tenancy
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  enable_classiclink_dns_support = var.enable_classiclink_dns_support

  tags = var.tags
}
