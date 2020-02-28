/* For more details on the configuration, visit the official documentation::
https://www.terraform.io/docs/providers/aws/r/nat_gateway.html
 */

locals {
  files_list = [
    "${md5(file("${path.module}/main.tf"))}",
    "${md5(file("${path.module}/output.tf"))}",
    "${md5(file("${path.module}/variables.tf"))}",
  ]
  current_deployment = "${join("", local.files_list)}"
}

resource "aws_nat_gateway" "ngw" {
  count = var.subnet_count

  allocation_id = element(var.allocation_id, count.index)
  subnet_id     = element(var.private_subnet_id, count.index)

  tags = var.tags
}