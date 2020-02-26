/* For more details on the configuration, visit the official documentation::
https://www.terraform.io/docs/providers/aws/r/subnet.html */

locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnet" {
  vpc_id                  = var.vpc_id
  count                   = var.az_count
  cidr_block              = cidrsubnet(var.cidr_block, 8, (count.index + 10))
  availability_zone       = data.aws_availability_zones.available.names[count.index + 1]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = var.tags

}